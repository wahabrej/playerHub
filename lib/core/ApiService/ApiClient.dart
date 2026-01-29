import 'dart:convert';
import 'package:flutter/foundation.dart'; // For debugPrint
import 'package:http/http.dart' as http;
import 'package:playerhub/core/ApiService/ApiEndPoint.dart';

class ApiClient {
  final Map<String, String> defaultHeaders;

  ApiClient({
    this.defaultHeaders = const {
      "Content-Type": "application/json",
    },
  });

  /// GET request
  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, String>? headers}) async {
    final url = endpoint;
    debugPrint('GET Request → $url');
    debugPrint('Headers: ${{...defaultHeaders, ...?headers}}');

    final response = await http.get(Uri.parse(url), headers: {...defaultHeaders, ...?headers});
    return _processResponse(response, url, null);
  }

  /// POST request
  Future<Map<String, dynamic>> post(String endpoint,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final url = endpoint;
    debugPrint('POST Request → $url');
    debugPrint('Headers: ${{...defaultHeaders, ...?headers}}');
    debugPrint('Body: ${body != null ? jsonEncode(body) : {}}');

    final response = await http.post(
      Uri.parse(url),
      headers: {...defaultHeaders, ...?headers},
      body: body != null ? jsonEncode(body) : null,
    );

    return _processResponse(response, url, body);
  }

  /// PUT request
  Future<Map<String, dynamic>> put(String endpoint,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final url = endpoint;
    debugPrint('PUT Request → $url');
    debugPrint('Headers: ${{...defaultHeaders, ...?headers}}');
    debugPrint('Body: ${body != null ? jsonEncode(body) : {}}');

    final response = await http.put(
      Uri.parse(url),
      headers: {...defaultHeaders, ...?headers},
      body: body != null ? jsonEncode(body) : null,
    );

    return _processResponse(response, url, body);
  }

  /// DELETE request
  Future<Map<String, dynamic>> delete(String endpoint,
      {Map<String, String>? headers}) async {
    final url = '${ApiEndPoint.baseUrl}$endpoint';
    debugPrint('DELETE Request → $url');
    debugPrint('Headers: ${{...defaultHeaders, ...?headers}}');

    final response = await http.delete(
      Uri.parse(url),
      headers: {...defaultHeaders, ...?headers},
    );

    return _processResponse(response, url, null);
  }

  /// Process response
  Map<String, dynamic> _processResponse(
      http.Response response, String url, Map<String, dynamic>? body) {
    debugPrint('Response from $url → Status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');

    final statusCode = response.statusCode;
    final responseBody = response.body;

    if (statusCode >= 200 && statusCode < 300) {
      if (responseBody.isNotEmpty) {
        return jsonDecode(responseBody) as Map<String, dynamic>;
      } else {
        return {};
      }
    } else {
      debugPrint('API Error at $url → Status: $statusCode, Body: $responseBody');
      throw Exception('API Error: $statusCode ${response.body}');
    }
  }
}
