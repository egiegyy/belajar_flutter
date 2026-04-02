import 'dart:convert';

import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/api/api_exception.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/utils/app_session.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Map<String, String> get _baseHeaders {
    return {
      'Accept': 'application/json',
    };
  }

  Future<Map<String, dynamic>> get(
    String url, {
    bool withAuth = false,
  }) async {
    final response = await http.get(
      Uri.parse(url),
      headers: _headers(withAuth: withAuth),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(
    String url, {
    required Map<String, String> body,
    bool withAuth = false,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      headers: _headers(withAuth: withAuth),
      body: body,
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> put(
    String url, {
    required Map<String, String> body,
    bool withAuth = false,
  }) async {
    final response = await http.put(
      Uri.parse(url),
      headers: _headers(withAuth: withAuth),
      body: body,
    );
    return _handleResponse(response);
  }

  Map<String, String> _headers({required bool withAuth}) {
    final headers = <String, String>{..._baseHeaders};
    final token = AppSession.token;

    if (withAuth && token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final rawBody = response.body.trim();
    final decodedBody = rawBody.isEmpty
        ? <String, dynamic>{}
        : jsonDecode(rawBody) as Map<String, dynamic>;

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decodedBody;
    }

    throw ApiException(_extractMessage(decodedBody, response.statusCode));
  }

  String _extractMessage(Map<String, dynamic> body, int statusCode) {
    final errors = body['errors'];
    if (errors is Map<String, dynamic>) {
      for (final value in errors.values) {
        if (value is List && value.isNotEmpty) {
          return '${value.first}';
        }
      }
    }

    final message = body['message'];
    if (message is String && message.isNotEmpty) {
      return message;
    }

    return 'Request gagal. Status code: $statusCode';
  }
}
