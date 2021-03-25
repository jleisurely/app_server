import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

import 'order_list.dart';

class CartList extends ManagedObject<_CartList> implements _CartList {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _CartList {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  int productId;

  int cartNumber;
  int attr;

  int userId;

  int status;

  int isBuy;

  @Relate(#cartList)
  OrderList orderList;
}