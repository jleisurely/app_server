import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/heroes.dart';
import 'package:my_app/model/hero.dart';
import 'package:my_app/model/user.dart';

class HeroesController extends ResourceController {
  HeroesController(this.context);

  final ManagedContext context;




  @Operation.post()//添加一篇文章
  FutureOr<Response> insertArticle(
      @Bind.body(ignore: ["createData"]) User article) async {
    // article.create_time = DateTime.now().toString();
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
  Future<Response> getHeroByID(@Bind.path('id') int id) async {
    final heroQuery = Query<User>(context)..where((h) => h.id).equalTo(id);
    final hero = await heroQuery.fetchOne();
    if (hero == null) {
      return Response.notFound();
    } 
    return Response.ok(hero);
  }
}


