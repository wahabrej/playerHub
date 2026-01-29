import 'package:playerhub/features/signup/data/SignUpRemoteDataSource.dart';
import 'package:playerhub/features/signup/domain/UserEntity.dart';
import 'package:playerhub/features/signup/domain/signUpRepository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDatasource signUpRemoteDatasource;

  SignUpRepositoryImpl(this.signUpRemoteDatasource);

  @override
  Future<SignupResult> signUp(
    String name,
    String email,
    String role,
    String password,
    String phone,
  ) async {
    final res = await signUpRemoteDatasource.signUp(
      name,
      email,
      role,
      password,
      phone,
    );
    return SignupResult(message: res['message']);
  }
}
