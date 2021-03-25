import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/heroes.dart';
import 'package:my_app/model/hero.dart';
import 'package:my_app/model/goods_detail.dart';

class GoodsController extends ResourceController {
  GoodsController(this.context);

  final ManagedContext context;




  @Operation.post()//添加一篇文章
  FutureOr<Response> insertGoods(
      @Bind.body(ignore: ["createData","id","commentScore","imgList","shopId"]) GoodsDetail goods) async {
    // article.create_time = DateTime.now().toString();
    // GoodsDetail goods;
//插入一条数据
    final result = await context.insertObject<GoodsDetail>(goods);
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
    final heroQuery = Query<GoodsDetail>(context)
      ..returningProperties((goods) => [goods.id, goods.goodsName,goods.salePrice,goods.focusImg]);
    final users = await heroQuery.fetch();

    return Response.ok(users);
  }

  @Operation.get('id')
  Future<Response> getHeroByID(@Bind.path('id') int id) async {
    final heroQuery = Query<GoodsDetail>(context)..where((h) => h.id).equalTo(id);
    final hero = await heroQuery.fetchOne();
    if (hero == null) {
      return Response.notFound();
    }
    return Response.ok(hero);
  }
}


