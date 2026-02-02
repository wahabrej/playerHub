import 'package:playerhub/features/Player/domain/Entity/PlayerEntity.dart';

abstract class PlayerRepository{


  Future<List<PlayerEntity>> getPlayer();
}