import 'package:playerhub/core/ApiService/ApiClient.dart';
import '../../../core/ApiService/ApiEndPoint.dart';
import 'MatchModel.dart';

class MatchRemoteDataSource {
  final ApiClient apiClient;

  MatchRemoteDataSource(this.apiClient);

  // Return a single MatchModel which contains a list of Matches
  Future<MatchModel> getMatchData() async {
    final response = await apiClient.get(
      ApiEndPoint.getAllMatchList,
      headers: {"Content-Type": "application/json"},
    );

    // If API returns a JSON object with 'matches' key
    final Map<String, dynamic> data = response as Map<String, dynamic>;

    return MatchModel.fromJson(data);
  }
}
