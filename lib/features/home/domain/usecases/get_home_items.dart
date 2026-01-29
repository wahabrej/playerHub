import '../entities/home_item_entity.dart';
import '../repositories/home_repository.dart';
class GetHomeItems {
  final HomeRepository repository;

  GetHomeItems(this.repository);

  Future<List<HomeItemEntity>> call() {
    return repository.getHomeItems();
  }
}