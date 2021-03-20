import 'package:aqueduct/managed_auth.dart';

import 'controller/goods_list_controller.dart';
import 'controller/heroes_controller.dart';
import 'my_app.dart';
import 'heroes.dart';
import 'AppConfig.dart';

import 'model/user.dart';
import 'model/goods_detail.dart';
import 'controller/ValidateController.dart';



import 'dart:convert' as convert;

import 'config/custom_config.dart';
import 'package:aqueduct/managed_auth.dart';
import 'constants.dart';
import 'controller/comment_controller.dart';
import 'controller/friend_controller.dart';
import 'controller/login_controller.dart';
import 'controller/message_controller.dart';
import 'controller/register_controller.dart';
import 'model/message.dart';
import 'model/user.dart';
import 'controller/chat_list_controller.dart';
import 'heroes.dart';
/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class MyAppChannel extends ApplicationChannel {
  ManagedContext context;
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  AuthServer authServer;
  Map<int, WebSocket> connections = Map();
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final AppConfig _config=AppConfig(options.configurationFilePath);
    options.port=_config.port;
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();//描述应用程序的数据模型
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
        _config.database.username,
        _config.database.password,
        _config.database.host,
        _config.database.port,
        _config.database.databaseName);//管理与单个数据库的连接
    context=ManagedContext(dataModel, psc);
    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);


    messageHub.listen((event) {
      if (event is Map && event['event'] == 'websocket_broadcast') {
        dynamic e = event['message'];
        int fromUserId = event['fromUserId'] as int;

        connections.values.forEach((socket) {
//          socket.add(event['message']);
          handleEvent(e, fromUserId: fromUserId);
        });
      }
    });
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router(notFoundHandler: (request) async {
      Response response=Response.notFound();//404的状态码
      response.contentType=ContentType.json;//内容类型
      response.body={'code': -1, 'msg': '404'};//内容
      await request.respond(response);//把内容相应出去
      logger.info("${request.toDebugString()}");//打印日志
    });

    router
        .route('/auth/token')
        .link(() => AuthController(authServer));
    router
        .route('/heroes/[:id]')
        .link(() => Authorizer.bearer(authServer))
        .link(() => HeroesController(context));
    // routera
    // router
    //     .route('/register')
    //     .link(() => RegisterController(authServer,context));

    router
        .route("/files/*")
        .link(() => FileController('static/',
//new
        onFileNotFound: (FileController controller, Request req) async {
          final file = File('static/3.jpeg');
          final byteStream = file.openRead();
          return Response.ok(
            byteStream,
          )
            ..encodeBody = false
            ..contentType = ContentType("image", "jpeg");
        })
      ..addCachePolicy(
          const CachePolicy(expirationFromNow: Duration(days: 10)),
              (path) => path.endsWith('.jpg'))); //用于判断哪些图片或资源格式需要缓存





    router
        .route("/register")
        .link(() => RegisterController(authServer, context));

    router.route("/login").link(() => LoginController(context));

    router
        .route("/comment")
        .link(() => Authorizer.bearer(authServer))
        .link(() => CommentController());

    router
        .route("/friend")
        .link(() => Authorizer.bearer(authServer))
        .link(() => FriendController(context));

    router
        .route("/chat_list")
        .link(() => Authorizer.bearer(authServer))
        .link(() => ChatListController(context));

    //跟服务器建立连接
    router
        .route("/connect")
        .link(() => Authorizer.bearer(authServer))
        .linkFunction((request) async {
      //连接的用户id
      int userId = request.authorization.ownerID;
      var socket = await WebSocketTransformer.upgrade(request.raw);

      print("userId：$userId的用户跟服务器建立连接");
      socket.listen((event) {
        print("server listen:${event}");
        handleEvent(event, fromUserId: userId);

        messageHub.add(
          {
            "event": "websocket_broadcast",
            "message": event,
            'fromUserId': userId,
          },
        );
      }, onDone: () {
        //socket连接断了的话，移除连接
        connections.remove(userId);
      });
      //保存连接
      connections[userId] = socket;

      print("当前连接用户有${connections.length}个");
      connections.keys.forEach((userId) {
        print("userId:$userId");
      });
      return null;
    });

    //查询消息记录
    router
        .route("/message/[:id]")
        .link(() => Authorizer.bearer(authServer))
        .link(() => MessageController(context));

    //创建goods
    router
        .route("/goods")
        .link(() => GoodsController(context));
    return router;
  }
  //处理事件
  handleEvent(dynamic event, {int fromUserId}) async {
    if (event is String) {
      try {
        var map = convert.jsonDecode(event.toString());
        //接收者的id
        int toUserId = map['toUserId'] as int;
        //消息内容
        String msg_content = map['msg_content'] as String;
        //消息类型
        int msg_type = map['msg_type'] as int;
        Message message = await saveMessage(
            fromUserId, toUserId, msg_content, msg_type, false);

        connections.keys.forEach((key) {
          if (key == toUserId || key == fromUserId) {
            bool selfUser = key == fromUserId;
            message.selfUser = selfUser;
            connections[key].add(convert.jsonEncode(message));
            print(
                "服务器进行中转消息： fromUserId:$fromUserId,toUserId:$toUserId,msg_content: $msg_content");
          }
        });
      } catch (e) {
        print("e:$e");
      }
    }
  }

  /**
   * 保存一条信息记录
   */
  Future<Message> saveMessage(int fromUserId, int toUserId, String msg_content,
      int msg_type, bool selfUser) async {
    Message message = Message();
    message
      ..selfUser = selfUser
      ..fromUserId = fromUserId
      ..toUserId = toUserId
      ..content = msg_content
      ..type = msg_type
      ..sendTime = DateTime.now();

    Query<Message> query = Query<Message>(context)..values = message;
    if (await query.insert() != null) {
      print("保存聊天信息成功：${message.asMap()}");
      return message;
    } else {
      return null;
    }
  }
}