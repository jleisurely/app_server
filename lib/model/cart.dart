import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

import 'attr_list.dart';
import 'cart_info.dart';

class Cart extends ManagedObject<_Cart> implements _Cart {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _Cart {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  CartInfo cart;

  AttrList attrList;

  String productImg;

  String productTitle;

  double productPrice;

  int productStock;
}