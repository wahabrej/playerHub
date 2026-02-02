import 'package:playerhub/features/home/domain/entities/homeDashBoardEntity.dart';

import '../entities/home_item_entity.dart';

abstract class HomeRepository {
  Future<List<HomeMatchEntity>> getHomeItems();
  Future<HomeDashboardEntity> getDashBoardData();
}