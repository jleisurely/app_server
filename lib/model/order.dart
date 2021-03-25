import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

import 'order_list.dart';


class Order extends ManagedObject<_Order> implements _Order {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _Order {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  String productId;

  String cartId;

  double realPayAmount;

  int couponId;

  int couponAmount;

  String phone;

  String name;

  String address;

  int payType;

  int freightAmount;

  String remarks;

  int orderStatus;

  int userId;

  String logistics;

  String logisticsNumber;

  int buyNumber;

  String orderId;

  String createTime;

  double totalPrice;

  String sendTime;

  String payTime;

  String receiveTime;

  String attrId;


  @Relate(#order)
  OrderList orderList;

}