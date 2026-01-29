import 'package:playerhub/core/ApiService/ApiClient.dart';
import '../../../core/ApiService/ApiEndPoint.dart';

class SignUpRemoteDatasource {
  final ApiClient apiClient;
  SignUpRemoteDatasource(this.apiClient);
  Future<Map<String, dynamic>> signUp(
    String name,
    String email,
    String role,
    String password,
    String phone,
  ) {
    return apiClient.post(
      ApiEndPoint.createAdminAccount,
      headers: {"Content-Type": "application/json"},
      body: {
        "name": name, "email": email,
        "role": role, "password": password,
        "phone": phone,

      },
    );
  }
}
