import 'package:playerhub/core/ApiService/ApiEndPoint.dart';

import '../../../core/ApiService/ApiClient.dart';

class LoginRemoteDataSources {
  final ApiClient client;
  LoginRemoteDataSources(this.client);

  Future<Map<String, dynamic>> login(String email, String password) {
    return client.post(
      ApiEndPoint.login,
      headers: {"Content-Type": "application/json"},
      body: {"email": email, "password": password},
    );
  }

  Future<Map<String, dynamic>> signup(String name, String email, String phone, String password) {
    return client.post(
      ApiEndPoint.createAdminAccount,
      headers: {"Content-Type": "application/json"},
      body: {"name": name, "email": email, "phone": phone, "password": password, "role": "admin"},
    );
  }
}
