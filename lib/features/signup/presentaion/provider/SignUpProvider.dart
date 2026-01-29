import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:playerhub/features/signup/data/SignUpRemoteDataSource.dart';
import 'package:playerhub/features/signup/data/SignUpRepositoryImpl.dart';
import 'package:playerhub/features/signup/domain/signUpUseCase.dart';

import '../../../../core/ApiService/ApiClient.dart';
import '../../domain/UserEntity.dart';


// State
class SignupState {
  final bool loading;
  final SignupResult? result;
  final String? error;

  SignupState({this.loading = false, this.result, this.error});
}

// Notifier
class SignupNotifier extends StateNotifier<SignupState> {
  final SignUpUseCase signupUseCase;

  SignupNotifier(this.signupUseCase) : super(SignupState());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String role,
  }) async {
    state = SignupState(loading: true);

    try {
      final result = await signupUseCase(
        name,
        email,
        role,
        password,
        phone,
      );

      state = SignupState(result: result);
    } catch (e) {
      state = SignupState(error: e.toString());
    }
  }
}

// Provider
final signupProvider =
StateNotifierProvider<SignupNotifier, SignupState>((ref) {
  final apiClient = ApiClient();
  final remote = SignUpRemoteDatasource(apiClient);
  final repository = SignUpRepositoryImpl(remote);
  final useCase = SignUpUseCase(repository);

  return SignupNotifier(useCase);
});
