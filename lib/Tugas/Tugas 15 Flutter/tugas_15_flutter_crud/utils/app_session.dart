import 'package:shared_preferences/shared_preferences.dart';

class AppSession {
  static const String _tokenKey = 'tugas15_auth_token';
  static const String _passwordKey = 'tugas15_account_password';
  static String? _token;
  static String? _password;

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(_tokenKey);
    _password = prefs.getString(_passwordKey);
  }

  static bool get isLoggedIn => _token != null && _token!.isNotEmpty;

  static String? get token => _token;
  static String? get password => _password;

  static Future<void> saveLogin(String token, {String? password}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    _token = token;
    if (password != null) {
      await prefs.setString(_passwordKey, password);
      _password = password;
    }
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_passwordKey);
    _token = null;
    _password = null;
  }
}
