import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/model/product_list.dart';
import 'package:my_app/model/product_specs_list.dart';
import 'package:my_app/my_app.dart';

import 'cart_list.dart';
import 'order.dart';

class OrderDetail extends ManagedObject<_OrderDetail> implements _OrderDetail {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _OrderDetail {
  @Column(primaryKey: true, autoincrement: true)
  int id;
  Order order;

  List<ProductList> productList;

  List<CartList> cartList;

  List<ProductSpecsList> productSpecsList;
}