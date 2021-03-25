import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

class Product extends ManagedObject<_Product> implements _Product {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _Product {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  String title;

  @Column()
  String productDesc;

  @Column()
  dynamic price;

  @Column()
  String detail;

  @Column()
  String attributeList;

  @Column()
  int stock;

  @Column()
  int status;

  @Column()
  dynamic orignPrice;

  @Column()
  int categoryId;

  @Column()
  String categoryName;

  @Column()
  int categorySubId;

  @Column()
  String categorySubName;

  @Column()
  String createTime;

  @Column()
  String updateTime;

  @Column()
  int freight;

  @Column()
  String placeOrigin;

  @Column()
  String album;

  @Column()
  String productSpecs;

  @Column()
  String thumbnail;

  @Column()
  int isDel;

  @Column()
  int salesVolume;

  @Column()
  int hot;

  @Column()
  int recommend;
}