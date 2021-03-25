import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

import 'cart.dart';

class CartInfo extends ManagedObject<_CartInfo> implements _CartInfo {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _CartInfo {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  int productId;

  int cartNumber;

  int attr;

  int userId;

  int status;

  int isBuy;

  @Relate(#cart)
  Cart cart;
}