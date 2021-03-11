import 'controller/heroes_controller.dart';
import 'my_app.dart';
import 'heroes.dart';
import 'AppConfig.dart';
import 'model/hero.dart';
import 'model/user.dart';
import 'controller/ValidateController.dart';
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

    // final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    // final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
    //     "wangyu", "12345678", "127.0.0.1", 5432, "aqueduct");
    //
    // context = ManagedContext(dataModel, persistentStore);
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
        .route('/heroes/[:id]')
        .link(() => HeroesController(context));
    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    router
        .route('/user/[:id]')
        .link(() => ValidateController())

        .link(() => HeroesController(context));

    // router
    //     .route("/files/*")
    //     .link(()=>FileController('static/'));
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

    return router;
  }
}