import 'package:my_app/heroes.dart';

class User extends ManagedObject<_User> implements _User {}

class _User {
  @primaryKey
  int id;

  @Column(unique: false)
  String name;

  @Column(unique: true)
  String mobile;

  @Column(unique: false)
  int role_id;

  @Column(unique: false)
  String enabled;

  @Column(unique: false)
  String create_time;

  @Column(unique: false)
  String modify_time;

  @Column(unique: false)
  String creator;

  @Column(unique: false)
  String modifier;

}