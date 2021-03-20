import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration2 extends Migration { 
  @override
  Future upgrade() async {
   		database.alterColumn("_GoodsDetail", "categoryId", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "firstRate", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "focusImg", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "goodsCode", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "goodsDesc", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "goodsHeight", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "goodsLong", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "goodsName", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "goodsStock", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "goodsWeight", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "goodsWidth", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "lastRate", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "sendCity", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "transferFeeTip", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "goodsId", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "goodsType", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "morePayStatus", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "parentCategoryId", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "platformOnline", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "purchaseNum", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "saleNum", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "salePrice", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "showIndex", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "specType", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "transferPrice", (c) {c.isNullable = true;});
		database.alterColumn("_GoodsDetail", "transferFeeType", (c) {c.isNullable = true;});
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    