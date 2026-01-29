import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/home_local_datasource.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/entities/home_item_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/get_home_items.dart';

// DI providers (add these to your main.dart or a di file)
final homeLocalDataSourceProvider = Provider<HomeLocalDataSource>((ref) => HomeLocalDataSource());

final homeRepositoryProvider = Provider<HomeRepository>(
      (ref) => HomeRepositoryImpl(localDataSource: ref.watch(homeLocalDataSourceProvider)),
);

final getHomeItemsUseCaseProvider = Provider<GetHomeItems>(
      (ref) => GetHomeItems(ref.watch(homeRepositoryProvider)),
);

// Main provider for home data
final homeProvider = FutureProvider<List<HomeItemEntity>>((ref) async {
  final useCase = ref.watch(getHomeItemsUseCaseProvider);
  return useCase();
});