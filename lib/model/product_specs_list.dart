import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

import 'order_list.dart';

class ProductSpecsList extends ManagedObject<_ProductSpecsList>
    implements _ProductSpecsList {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _ProductSpecsList {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  int productId;

  String specs;

  String createTime;

  String productStock;

  String productPrice;

  @Relate(#productSpecsList)
  OrderList orderList;
}