import 'dart:convert';

import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorageApi {
  static const String usersKey = 'tugas15_users';

  Future<List<UserModel>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final rawUsers = prefs.getString(usersKey);

    if (rawUsers == null || rawUsers.isEmpty) {
      return [];
    }

    final decoded = jsonDecode(rawUsers) as List<dynamic>;
    return decoded
        .map((item) => UserModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveUsers(List<UserModel> users) async {
    final prefs = await SharedPreferences.getInstance();
    final rawUsers = jsonEncode(users.map((user) => user.toJson()).toList());
    await prefs.setString(usersKey, rawUsers);
  }
}
