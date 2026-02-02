import 'package:playerhub/core/ApiService/ApiClient.dart';
import 'package:playerhub/core/ApiService/ApiEndPoint.dart';
import 'package:playerhub/features/Player/data/model/PlayerModel.dart';

class PlayerRemoteDataSources {
  final ApiClient apiClient;

  PlayerRemoteDataSources(this.apiClient);

  Future<PlayerModel> getPlayer() async {
    final response = await apiClient.get(
      ApiEndPoint.getAllPlayerList,
      headers: {"Content-Type": "application/json"},
    );

    Map<String,dynamic> data = response as Map<String,dynamic>;

    return PlayerModel.fromJson(data);


  }
}
