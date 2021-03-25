import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

import 'cart.dart';

class AttrList extends ManagedObject<_AttrList> implements _AttrList {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _AttrList {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  int productId;

  String specs;

  String createTime;

  String productStock;

  String productPrice;

  @Relate(#attrList)
  Cart cart;
}