import 'package:playerhub/features/signup/domain/UserEntity.dart';

abstract class SignUpRepository {
  Future<SignupResult> signUp(
    String name,
    String email,
    String role,
    String password,
    String phone,
  );
}
