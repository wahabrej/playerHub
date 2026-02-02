import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playerhub/core/ApiService/TokenStorage.dart';
import '../../../../core/ApiService/ApiClient.dart';
import '../../data/datasources/Home_remote_data_sources.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/entities/home_item_entity.dart';
import '../../domain/entities/homeDashBoardEntity.dart'; // Dashboard Entity ইমপোর্ট করুন

// ১. Repository Provider (FutureProvider হিসেবে)
final homeRepositoryProvider = FutureProvider<HomeRepositoryImpl>((ref) async {
  final tokenStorage = TokenStorage();
  final token = await tokenStorage.getToken();
  final apiClient = ApiClient(token: token);
  return HomeRepositoryImpl(HomeRemoteDataSource(apiClient));
});

// ২. Match History List এর জন্য
final homeMatchesProvider = FutureProvider<List<HomeMatchEntity>>((ref) async {
  final repository = await ref.watch(homeRepositoryProvider.future);
  return repository.getHomeItems();
});

// ৩. Dashboard Data এর জন্য (নতুন যুক্ত করা হয়েছে)
final dashboardDataProvider = FutureProvider<HomeDashboardEntity>((ref) async {
  final repository = await ref.watch(homeRepositoryProvider.future);
  return repository.getDashBoardData();
});