import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/heroes.dart';
import 'package:my_app/model/hero.dart';
import 'package:my_app/model/user.dart';

class RegisterController extends ResourceController {
  RegisterController(this.context, this.authServer);

  final ManagedContext context;
  final AuthServer authServer;
  UserController() {
    acceptedContentTypes = [ContentType.json, ContentType.html];
    responseContentType = ContentType.json;
  }

  @Operation.post()
  Future<Response> createUser(@Bind.body() User user) async {
    if (user.name == null || user.password == null) {
      return Response.badRequest(
          body: {"error": "username and password required."});
    }

    final salt = AuthUtility.generateRandomSalt();
    final hashedPassword = authServer.hashPassword(user.password, salt);

    final query = Query<User>(context)
      ..values = user
      ..values.hashedPassword = hashedPassword
      ..values.salt = salt
      ..values.name = user.name;

    final u = await query.insert();
    final token = await authServer.authenticate(
        u.name,
        query.values.password,
        request.authorization.credentials.username,
        request.authorization.credentials.password);

    return AuthController.tokenResponse(token);
  }




  @Operation.post()//添加一篇文章
  FutureOr<Response> insertArticle(
      @Bind.body(ignore: ["createData"]) User article) async {
    article.create_time = DateTime.now().toString();
//插入一条数据
    final result = await context.insertObject<User>(article);
    return Response.ok(result);;
  }

  @Operation.delete('id')
  Future<Response> deleteHeroByID(@Bind.path('id') int id) async {
    final heroQuery = Query<Hero>(context)..where((h) => h.id).equalTo(id);
    final hero = await heroQuery.delete();
    if (hero == null) {
      return Response.notFound();
    }
    return Response.ok(hero);
  }

  @Operation.put('id')
  Future<Response> updateHeroById(@Bind.path('id') int id ,@Bind.body() Hero inputHero) async {
    final heroQuery = Query<Hero>(context)
      ..where((h) => h.id).equalTo(id)
      ..values = inputHero;
    final hero = await heroQuery.updateOne();
    if (hero == null) {
      return Response.notFound();
    }
    return Response.ok(hero);
  }

  // @Operation.get()
  // Future<Response> getAllHeroes() async {
  //   final heroQuery = Query<Hero>(context);
  //   final heroes = await heroQuery.fetch();
  //
  //   return Response.ok(heroes);
  // }

  @Operation.get()
  Future<Response> getAllUser() async {
    final heroQuery = Query<User>(context);
    final users = await heroQuery.fetch();

    return Response.ok(users);
  }

  @Operation.get('id')
  Future<Response> getHeroByID(@Bind.path('id') String mobile) async {
    final heroQuery = Query<User>(context)..where((h) => h.mobile).equalTo(mobile);
    final hero = await heroQuery.fetchOne();
    if (hero == null) {
      return Response.ok("可以注册");
    }
    return Response.ok(hero);
  }
}


