import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/model/specs_list.dart';
import 'package:my_app/my_app.dart';

class Detail extends ManagedObject<_Detail> implements _Detail {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _Detail {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  String title;

  String productDesc;

  double price;

  String detail;

  String attributeList;

  int stock;

  int status;

  double orignPrice;

  int freight;

  String placeOrigin;

  String album;

  String thumbnail;

  int salesVolume;

  int hot;

  int recommend;

  List<SpecsList> specsList;
}