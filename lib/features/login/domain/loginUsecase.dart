import 'package:playerhub/features/login/domain/UserEntity.dart';
import 'package:playerhub/features/login/domain/loginRepository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<UserEntity> call(String email, String password) {
    return loginRepository.login(email, password);
  }
}
