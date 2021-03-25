import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration10 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("_ArticleList", SchemaColumn("desc1", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false));
		database.deleteColumn("_ArticleList", "desc");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    