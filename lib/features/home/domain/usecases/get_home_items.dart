import 'package:playerhub/features/home/domain/entities/homeDashBoardEntity.dart';

import '../entities/home_item_entity.dart';
import '../repositories/home_repository.dart';
class GetHomeItems {
  final HomeRepository repository;

  GetHomeItems(this.repository);

  Future<List<HomeMatchEntity>> call() {
    return repository.getHomeItems();


  }  Future<HomeDashboardEntity> call1() {
    return repository.getDashBoardData();
  }
}