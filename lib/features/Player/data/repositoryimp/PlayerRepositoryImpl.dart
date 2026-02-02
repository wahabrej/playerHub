import 'package:playerhub/features/Player/data/RemoteDataSources/RemoteDataSources.dart';
import 'package:playerhub/features/Player/domain/Entity/PlayerEntity.dart';
import 'package:playerhub/features/Player/domain/Repository/PlayerRepository.dart';

class PlayerRepositoryImpl  implements PlayerRepository{
   final PlayerRemoteDataSources playerRemoteDataSources;
   PlayerRepositoryImpl(this.playerRemoteDataSources);
  Future<List<PlayerEntity>> getPlayer()async{

    final model = await playerRemoteDataSources.getPlayer();
    final playerList = model.players ?? [];
    return playerList.map((player){
      return PlayerEntity(
          Id: player.sId ?? "",
          name: player.name ?? "",
          parent_email: player.parentEmail ?? "",
          parent_phone: player.parentPhone ?? "",
          username: player.username ?? "",
          parent_name:player.parentName ?? "",
          avatar: player.avatar ?? "",
      );
    }).toList();


  }
}