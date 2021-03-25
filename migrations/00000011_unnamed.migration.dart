import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration11 extends Migration { 
  @override
  Future upgrade() async {
   		database.deleteColumn("_ArticleList", "desc1");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    