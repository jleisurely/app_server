import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

import 'detail.dart';

class SpecsList extends ManagedObject<_SpecsList> implements _SpecsList {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _SpecsList {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  // ManagedSet<String> checkedCities;

  String name;

  @Relate(#specsList)
  Detail detail;
}