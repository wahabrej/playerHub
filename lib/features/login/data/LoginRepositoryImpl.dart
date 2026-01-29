import 'package:playerhub/core/ApiService/TokenStorage.dart';
import 'package:playerhub/features/login/data/LoginModel.dart';
import 'package:playerhub/features/login/data/RemoteDataSource.dart';
import 'package:playerhub/features/login/domain/UserEntity.dart';
import 'package:playerhub/features/login/domain/loginRepository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSources loginRemoteDataSources;
  final TokenStorage tokenStorage;

  LoginRepositoryImpl(this.loginRemoteDataSources, this.tokenStorage);

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final res = await loginRemoteDataSources.login(email, password);

      final loginModel = LoginModel.fromJson(res);

      await tokenStorage.saveToken(loginModel.token);

      final user = loginModel.user;

      return UserEntity(
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        role: user.role,
        isVerified: user.isVerified,
        active: user.active,
        avatar: user.avatar,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
        token: user.token,
      );
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }
}
