import 'UserEntity.dart';

abstract class LoginRepository {
  Future<UserEntity> login(String email, String password);
}
