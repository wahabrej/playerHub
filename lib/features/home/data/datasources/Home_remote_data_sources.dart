import 'package:playerhub/core/ApiService/ApiClient.dart';
import 'package:playerhub/features/home/data/models/home_data_model.dart';
import '../../../../core/ApiService/ApiEndPoint.dart';
import '../models/home_item_model.dart';
class HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSource(this.apiClient);

  Future<List<HomeMathModel>> getMatches() async {
    final response = await apiClient.get(
      ApiEndPoint.adminAllMatchHistory,
      headers: {"Content-Type": "application/json"},
    );

    final List<dynamic> data = response as List<dynamic>;

    return data.map((item) => HomeMathModel.fromJson(item)).toList();
  }
  Future<HomeDashBoardModel> getDashBoardData() async {
    final response = await apiClient.get(
      ApiEndPoint.adminHomeData,
      headers: {"Content-Type": "application/json"},
    );

    //  Model.fromJson
    return HomeDashBoardModel.fromJson(response as Map<String, dynamic>);
  }
}
