import 'package:playerhub/core/ApiService/ApiEndPoint.dart';
import '../../../core/ApiService/ApiClient.dart';

class LoginRemoteDataSources {
  final ApiClient client;
  LoginRemoteDataSources(this.client);

  Future<Map<String, dynamic>> login(String email, String password) async {
    // We await the dynamic result and cast it to Map
    final response = await client.post(
      ApiEndPoint.login,
      headers: {"Content-Type": "application/json"},
      body: {"email": email, "password": password},
    );
    return response as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> signup(String name, String email, String phone, String password) async {
    final response = await client.post(
      ApiEndPoint.createAdminAccount,
      headers: {"Content-Type": "application/json"},
      body: {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "role": "admin"
      },
    );
    return response as Map<String, dynamic>;
  }
}