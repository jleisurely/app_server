import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

import 'children.dart';

class Classify extends ManagedObject<_Classify> implements _Classify {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _Classify {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  String classifyName;

  int parentId;

  String img;


  ManagedSet<Children> children;

}