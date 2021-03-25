import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';
import 'comment.dart';

class UserInfo extends ManagedObject<_UserInfo> implements _UserInfo {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _UserInfo {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  String creteTime;

  @Column()
  String phone;

  @Column()
  String password;

  @Column()
  String email;

  @Column()
  String face;

  @Column()
  String userName;


  @Relate(#userInfo)
  Comment comment;
}