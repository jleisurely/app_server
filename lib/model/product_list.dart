import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

import 'order_list.dart';

class ProductList extends ManagedObject<_ProductList> implements _ProductList {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _ProductList {
  @Column(primaryKey: true, autoincrement: true)
  int id;


  String title;

  String productDesc;

  double price;

  String detail;

  String attributeList;

  int stock;

  int status;

  double orignPrice;

  int categoryId;

  String categoryName;

  int categorySubId;

  String categorySubName;

  String createTime;

  String updateTime;

  int freight;

  String placeOrigin;

  String album;

  String productSpecs;

  String thumbnail;

  int isDel;

  int salesVolume;

  int hot;

  int recommend;


  @Relate(#productList)
  OrderList orderList;
}