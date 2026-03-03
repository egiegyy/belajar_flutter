import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  static const String _usernameKey = "username";
  static const String _passwordKey = "password";
  static const String _loginKey = "isLogin";

  static Future<void> register({
    required String username,
    required String password,
  }) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_usernameKey, username);
    await pref.setString(_passwordKey, password);
  }

  static Future<bool> login({
    required String username,
    required String password,
  }) async {
    final pref = await SharedPreferences.getInstance();

    final savedUser = pref.getString(_usernameKey);
    final savedPass = pref.getString(_passwordKey);

    if (username == savedUser && password == savedPass) {
      await pref.setBool(_loginKey, true);
      return true;
    }
    return false;
  }

  static Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_loginKey) ?? false;
  }

  static Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(_loginKey, false);
  }
}
