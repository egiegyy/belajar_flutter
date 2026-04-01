import 'dart:convert';

import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/models/user_model.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/utils/app_session.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://absensib1.mobileprojp.com';

  Map<String, String> _headers({bool withAuth = false}) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (withAuth && AppSession.token != null) {
      headers['Authorization'] = 'Bearer ${AppSession.token}';
    }

    return headers;
  }

  // Register user baru ke API.
  Future<String> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/register'),
        headers: _headers(),
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      final body = _decodeBody(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return _extractMessage(body, fallback: 'Register berhasil.');
      }

      throw Exception(_extractMessage(body, fallback: 'Register gagal.'));
    } catch (e) {
      throw Exception('Terjadi kesalahan saat register: $e');
    }
  }

  // Login user dan simpan token ke memory.
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/login'),
        headers: _headers(),
        body: jsonEncode({'email': email, 'password': password}),
      );

      final body = _decodeBody(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final token = _extractToken(body);
        if (token == null || token.isEmpty) {
          throw Exception('Token login tidak ditemukan.');
        }

        final user = _tryExtractUser(body);
        await AppSession.saveLoginSession(authToken: token, user: user);
        return token;
      }

      throw Exception(_extractMessage(body, fallback: 'Login gagal.'));
    } catch (e) {
      throw Exception('Terjadi kesalahan saat login: $e');
    }
  }

  // Ambil data profile user yang sedang login.
  Future<UserModel> getProfile() async {
    try {
      final endpoints = <String>['/api/user', '/api/profile', '/api/me'];

      for (final endpoint in endpoints) {
        final response = await http.get(
          Uri.parse('$baseUrl$endpoint'),
          headers: _headers(withAuth: true),
        );

        final body = _decodeBody(response.body);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final user = _extractUser(body);
          AppSession.currentUser = user;
          return user;
        }
      }

      if (AppSession.currentUser != null) {
        return AppSession.currentUser!;
      }

      throw Exception('Endpoint profile tidak ditemukan.');
    } catch (e) {
      if (AppSession.currentUser != null) {
        return AppSession.currentUser!;
      }
      throw Exception('Terjadi kesalahan saat mengambil profile: $e');
    }
  }

  // Update nama dan email user menggunakan endpoint PUT.
  Future<UserModel> updateProfile({
    required String name,
    required String email,
  }) async {
    try {
      final endpoints = <String>[
        '/api/user/update',
        '/api/user',
        '/api/profile/update',
        '/api/profile',
      ];

      for (final endpoint in endpoints) {
        final response = await http.put(
          Uri.parse('$baseUrl$endpoint'),
          headers: _headers(withAuth: true),
          body: jsonEncode({'name': name, 'email': email}),
        );

        final body = _decodeBody(response.body);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final user = _extractUser(
            body,
            fallback: UserModel(name: name, email: email),
          );
          AppSession.currentUser = user;
          return user;
        }
      }

      throw Exception('Endpoint update profile tidak ditemukan.');
    } catch (e) {
      throw Exception('Terjadi kesalahan saat update profile: $e');
    }
  }

  Map<String, dynamic> _decodeBody(String body) {
    if (body.isEmpty) {
      return {};
    }

    final decoded = jsonDecode(body);
    return decoded is Map<String, dynamic> ? decoded : {};
  }

  String _extractMessage(
    Map<String, dynamic> body, {
    required String fallback,
  }) {
    return body['message'] as String? ?? body['msg'] as String? ?? fallback;
  }

  String? _extractToken(Map<String, dynamic> body) {
    if (body['token'] is String) {
      return body['token'] as String;
    }

    if (body['access_token'] is String) {
      return body['access_token'] as String;
    }

    if (body['data'] is Map<String, dynamic>) {
      final data = body['data'] as Map<String, dynamic>;
      return data['token'] as String? ?? data['access_token'] as String?;
    }

    return null;
  }

  UserModel _extractUser(Map<String, dynamic> body, {UserModel? fallback}) {
    if (body['data'] is Map<String, dynamic>) {
      return UserModel.fromJson(body['data'] as Map<String, dynamic>);
    }

    if (body['user'] is Map<String, dynamic>) {
      return UserModel.fromJson(body['user'] as Map<String, dynamic>);
    }

    if (body.containsKey('name') || body.containsKey('email')) {
      return UserModel.fromJson(body);
    }

    if (fallback != null) {
      return fallback;
    }

    throw Exception('Data user tidak ditemukan pada response.');
  }

  UserModel? _tryExtractUser(Map<String, dynamic> body) {
    try {
      return _extractUser(body);
    } catch (_) {
      return null;
    }
  }
}
