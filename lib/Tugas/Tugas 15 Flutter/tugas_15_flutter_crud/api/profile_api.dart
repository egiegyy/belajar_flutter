import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/api/api_client.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/api/api_endpoints.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/models/user_model.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/utils/app_session.dart';

class ProfileApi {
  final ApiClient _client;

  ProfileApi({ApiClient? client}) : _client = client ?? ApiClient();

  Future<UserModel> getProfile() async {
    final token = AppSession.token;
    if (token == null || token.isEmpty) {
      throw Exception('Session login tidak ditemukan.');
    }

    final response = await _client.get(
      ApiEndpoints.profile,
      withAuth: true,
    );
    return UserModel.fromJson(response);
  }

  Future<UserModel> updateProfile({
    required String name,
    required String email,
  }) async {
    final token = AppSession.token;
    if (token == null || token.isEmpty) {
      throw Exception('Session login tidak ditemukan.');
    }

    final response = await _client.put(
      ApiEndpoints.profile,
      withAuth: true,
      body: {
        'name': name.trim(),
        'email': email.trim(),
      },
    );
    return UserModel.fromJson(response);
  }
}
