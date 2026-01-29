import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/profile_local_datasource.dart';
import '../../data/repositories/profile_respository_impl.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/profile_usecase.dart';                  // fixed: profile_usecase → get_profile_info (standard name)

// ────────────────────────────────────────────────────────────────
// DI Providers (same style as home_provider)
// ────────────────────────────────────────────────────────────────

final profileLocalDatasourceProvider = Provider<ProfileLocalDatasource>(
      (ref) => ProfileLocalDatasource(),
);

final profileRepositoryProvider = Provider<ProfileRepository>(
      (ref) => ProfileRepositoryImpl(
    profileLocalDatasource: ref.watch(profileLocalDatasourceProvider),
  ),
);

final getProfileInfoUseCaseProvider = Provider<GetProfileInfo>(
      (ref) => GetProfileInfo(ref.watch(profileRepositoryProvider)),
);

// ────────────────────────────────────────────────────────────────
// Main provider for profile data (FutureProvider like home)
// ────────────────────────────────────────────────────────────────

final profileProvider = FutureProvider<List<ProfileEntity>>((ref) async {
  final useCase = ref.watch(getProfileInfoUseCaseProvider);
  return useCase(); // calls GetProfileInfo.call()
});