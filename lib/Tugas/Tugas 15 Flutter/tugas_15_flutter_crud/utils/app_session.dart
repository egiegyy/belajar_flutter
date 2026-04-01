import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSession {
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _tokenKey = 'auth_token';
  static String? token;
  static UserModel? currentUser;

  static bool get isLoggedIn => token != null && token!.isNotEmpty;

  static Future<void> saveLoginSession({
    required String authToken,
    UserModel? user,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    token = authToken;
    currentUser = user;
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_tokenKey, authToken);
  }

  static Future<bool> restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool(_isLoggedInKey) ?? false;
    final savedToken = prefs.getString(_tokenKey);

    if (!loggedIn || savedToken == null || savedToken.isEmpty) {
      token = null;
      currentUser = null;
      return false;
    }

    token = savedToken;
    return true;
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    token = null;
    currentUser = null;
    await prefs.remove(_isLoggedInKey);
    await prefs.remove(_tokenKey);
  }
}
