import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/model/user_info.dart';
import 'package:my_app/my_app.dart';

class Comment extends ManagedObject<_Comment> implements _Comment {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _Comment {
  @Column(primaryKey: true, autoincrement: true)
  int id;
  String comment;

  String commentImg;

  String createTime;


  String orderId;

  int productId;

  int star;

  int userId;

  UserInfo userInfo;
}