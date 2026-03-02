import 'package:flutter_application_1/Tugas/Tugas%2011%20Flutter/modelt11.dart';
import 'package:flutter_application_1/day%2016/database/sqflite.dart';

class UserController {
  static Future<void> registerUser(UserModeltugas user) async {
    final dbs = await DBHelper.db();
    await dbs.insert('user', user.toMap());
    print(user.toMap());
  }

  static Future<List<UserModeltugas>> getAlluser() async {
    final dbs = await DBHelper.db();
    print(dbs);
    final List<Map<String, dynamic>> results = await dbs.query("user");
    print(results);
    // print(results.map((e) => UserModeltugas.fromMap(e)).toList());
    return results.map((e) => UserModeltugas.fromMap(e)).toList();
  }
}
