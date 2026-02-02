import 'package:playerhub/features/Player/domain/Entity/PlayerEntity.dart';
import 'package:playerhub/features/Player/domain/Repository/PlayerRepository.dart';

class PlayerUseCase {

  final PlayerRepository playerRepository;

  PlayerUseCase(this.playerRepository);
  Future<List<PlayerEntity>> call()async{
     return playerRepository.getPlayer();

  }


}