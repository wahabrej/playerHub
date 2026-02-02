import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playerhub/core/ApiService/ApiClient.dart';
import 'package:playerhub/core/ApiService/TokenStorage.dart';

import '../../data/MatchRemoteDataSource.dart';
import '../../data/MatchRepositoryImpl.dart';
import '../../domain/MatchEntity.dart';


// ========================================
// 1️⃣ Repository Provider
// ========================================
final matchRepositoryProvider = FutureProvider<MatchRepositoryImpl>((ref) async {

  final tokenStorage = TokenStorage();
  final token = await tokenStorage.getToken();

  final apiClient = ApiClient(token: token);

  return MatchRepositoryImpl(
    MatchRemoteDataSource(apiClient),
  );
});


// ========================================
// 2️⃣ Match List Provider
// ========================================
final matchListProvider = FutureProvider<List<MatchEntity>>((ref) async {

  final repository = await ref.watch(matchRepositoryProvider.future);

  return repository.getMatchData();
});
