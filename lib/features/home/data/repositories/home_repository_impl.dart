import '../../domain/entities/home_item_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;
  HomeRepositoryImpl({required this.localDataSource});
  @override
  Future<List<HomeItemEntity>> getHomeItems() async {
    final models = await localDataSource.getHomeItems();
    return models
        .map(
          (model) => HomeItemEntity(
        naiScore: model.naiScore,
        dailyIntakeProgress: model.dailyIntakeProgress,
        sodiumStatus: model.sodiumStatus,
        dailyScores: model.dailyScores,
        completionPercentage: model.completionPercentage,
        caloriesNeeded: model.caloriesNeeded,
        caloriesEaten: model.caloriesEaten,
      ),
    )
        .toList();
  }
}