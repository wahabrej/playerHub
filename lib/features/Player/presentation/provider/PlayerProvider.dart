import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playerhub/core/ApiService/ApiClient.dart';
import 'package:playerhub/core/ApiService/TokenStorage.dart';
import 'package:playerhub/features/Player/data/RemoteDataSources/RemoteDataSources.dart';
import 'package:playerhub/features/Player/data/repositoryimp/PlayerRepositoryImpl.dart';
import 'package:playerhub/features/Player/domain/Entity/PlayerEntity.dart';

// ========================================
// 1️⃣ Repository Provider
// ========================================
final playerRepositoryProvider = FutureProvider<PlayerRepositoryImpl>((ref) async {

  final tokenStorage = TokenStorage();
  final token = await tokenStorage.getToken();

  final apiClient = ApiClient(token: token);

  return PlayerRepositoryImpl(
    PlayerRemoteDataSources(apiClient),
  );
});


// ========================================
// 2️⃣ Match List Provider
// ========================================
final playerListProvider = FutureProvider<List<PlayerEntity>>((ref) async {

  final repository = await ref.watch(playerRepositoryProvider.future);

  return repository.getPlayer();
});
