import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

class Address extends ManagedObject<_Address> implements _Address {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _Address {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  int userId;

  @Column()
  int isDefault;

  @Column()
  String province;

  @Column()
  String city;

  @Column()
  String area;

  @Column()
  String detail;

  @Column()
  String phone;

  @Column()
  String consignee;

}