import '../entities/home_item_entity.dart';

abstract class HomeRepository {
  Future<List<HomeItemEntity>> getHomeItems();
}