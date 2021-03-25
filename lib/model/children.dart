import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

import 'classify.dart';

class Children extends ManagedObject<_Children> implements _Children {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _Children {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  String classifyName;

  int parentId;

  String img;

  @Relate(#children)
  Classify classify;
}