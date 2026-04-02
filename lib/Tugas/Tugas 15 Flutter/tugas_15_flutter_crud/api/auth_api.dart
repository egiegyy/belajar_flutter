import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/api/api_client.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/api/api_endpoints.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/api/api_exception.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/models/user_model.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/utils/app_session.dart';

class AuthApi {
  final ApiClient _client;

  AuthApi({ApiClient? client}) : _client = client ?? ApiClient();

  Future<String> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      ApiEndpoints.register,
      body: {
        'name': name.trim(),
        'email': email.trim(),
        'password': password,
        'password_confirmation': password,
      },
    );

    final message = response['message'];
    if (message is String && message.isNotEmpty) {
      return message;
    }

    return 'Registrasi berhasil.';
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      ApiEndpoints.login,
      body: {
        'email': email.trim(),
        'password': password,
      },
    );

    final token = _extractToken(response);
    if (token == null || token.isEmpty) {
      throw const ApiException(
        'Login berhasil, tetapi token dari server tidak ditemukan.',
      );
    }

    await AppSession.saveLogin(token, password: password);

    final userData = _extractUserMap(response);
    if (userData != null) {
      return UserModel.fromJson(userData);
    }

    return UserModel(
      name: response['name']?.toString() ?? '',
      email: response['email']?.toString() ?? email.trim(),
    );
  }

  String? _extractToken(Map<String, dynamic> response) {
    final candidates = [
      response['token'],
      response['access_token'],
      response['api_token'],
    ];

    final data = response['data'];
    if (data is Map<String, dynamic>) {
      candidates.addAll([
        data['token'],
        data['access_token'],
        data['api_token'],
      ]);
    }

    for (final candidate in candidates) {
      if (candidate is String && candidate.isNotEmpty) {
        return candidate;
      }
    }

    return null;
  }

  Map<String, dynamic>? _extractUserMap(Map<String, dynamic> response) {
    final user = response['user'];
    if (user is Map<String, dynamic>) {
      return user;
    }

    final data = response['data'];
    if (data is Map<String, dynamic>) {
      final nestedUser = data['user'];
      if (nestedUser is Map<String, dynamic>) {
        return nestedUser;
      }

      if (data.containsKey('name') || data.containsKey('email')) {
        return data;
      }
    }

    if (response.containsKey('name') || response.containsKey('email')) {
      return response;
    }

    return null;
  }
}
