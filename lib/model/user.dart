import 'package:my_app/heroes.dart';
import 'package:aqueduct/managed_auth.dart';

class User extends ManagedObject<_User> implements _User, ManagedAuthResourceOwner<_User> {
  @Serialize(input: true, output: false)
  String password;

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'username': username,
      'password': password,
      'tokens':tokens
    };
  }
}
class _User extends ResourceOwnerTableDefinition {

}