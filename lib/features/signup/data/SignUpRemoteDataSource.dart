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
      ) async { // Added async
    final response = await apiClient.post( // Added await
      ApiEndPoint.createAdminAccount,
      headers: {"Content-Type": "application/json"},
      body: {
        "name": name,
        "email": email,
        "role": role,
        "password": password,
        "phone": phone,
      },
    );

    // Cast the dynamic response to the expected Map type
    return response as Map<String, dynamic>;
  }
}