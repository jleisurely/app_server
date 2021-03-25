import 'package:aqueduct/aqueduct.dart';
import 'package:my_app/my_app.dart';

class ArticleList extends ManagedObject<_ArticleList> implements _ArticleList {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _ArticleList {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  String title;

  // String desc1;

  String content;

  String createTime;

  int productId;

  int viewCount;
}