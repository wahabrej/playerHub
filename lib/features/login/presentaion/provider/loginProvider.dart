import 'package:flutter_riverpod/legacy.dart';
import 'package:playerhub/features/login/domain/UserEntity.dart';
import 'package:playerhub/features/login/domain/loginUseCase.dart';
import '../../../../core/ApiService/ApiClient.dart';
import '../../../../core/ApiService/TokenStorage.dart';
import '../../data/LoginRepositoryImpl.dart';
import '../../data/RemoteDataSource.dart';

// ---------- State ----------
class LoginState {
  final bool loading;
  final UserEntity? user;
  final String? error;

  LoginState({
    this.loading = false,
    this.user,
    this.error,
  });
}

// ---------- Notifier ----------
class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUseCase loginUseCase;

  LoginNotifier(this.loginUseCase) : super(LoginState());

  Future<void> login(String email, String password) async {
    state = LoginState(loading: true);

    try {
      final user = await loginUseCase(email, password);
      state = LoginState(user: user);
    } catch (e) {
      state = LoginState(error: e.toString());
    }
  }
}

// ---------- Provider ----------
final loginProvider =
StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final apiClient = ApiClient();
  final tokenStorage = TokenStorage();
  final remote = LoginRemoteDataSources(apiClient);
  final repository = LoginRepositoryImpl(remote, tokenStorage);
  final useCase = LoginUseCase(repository);

  return LoginNotifier(useCase);
});
