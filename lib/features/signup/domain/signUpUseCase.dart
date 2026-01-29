import 'package:playerhub/features/signup/domain/UserEntity.dart';
import 'package:playerhub/features/signup/domain/signUpRepository.dart';

class SignUpUseCase {
  final SignUpRepository signUpRepository;

  SignUpUseCase(this.signUpRepository);

  Future<SignupResult> call(
    String name,
    String email,
    String role,
    String password,
    String phone,
  ) {
    return signUpRepository.signUp(name, email, role, password, phone);
  }
}
