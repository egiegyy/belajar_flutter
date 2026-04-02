import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/api/auth_api.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/api/api_client.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/api/profile_api.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/models/user_model.dart';

class ApiService {
  late final AuthApi _authApi;
  late final ProfileApi _profileApi;

  ApiService({ApiClient? client}) {
    final sharedClient = client ?? ApiClient();
    _authApi = AuthApi(client: sharedClient);
    _profileApi = ProfileApi(client: sharedClient);
  }

  Future<String> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return _authApi.register(
      name: name,
      email: email,
      password: password,
    );
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    return _authApi.login(
      email: email,
      password: password,
    );
  }

  Future<UserModel> getProfile() async {
    return _profileApi.getProfile();
  }

  Future<UserModel> updateProfile({
    required String name,
    required String email,
  }) async {
    return _profileApi.updateProfile(
      name: name,
      email: email,
    );
  }
}
