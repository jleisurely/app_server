import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/model/product_list.dart';
import 'package:my_app/model/product_specs_list.dart';
import 'package:my_app/my_app.dart';

import 'cart_list.dart';
import 'order.dart';

class OrderList extends ManagedObject<_OrderList> implements _OrderList {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _OrderList {
  @Column(primaryKey: true, autoincrement: true)
  int id;


  Order order;


  ManagedSet<ProductList> productList;


  ManagedSet<CartList> cartList;


  ManagedSet<ProductSpecsList> productSpecsList;

  // @Column()
  // ManagedSet<String> comment;

}



