import 'package:flutter_application_1/Tugas/Tugas%2011%20&%2012%20Flutter/database/sqflite.dart';
import '../model/progress_model.dart';

class UserController {
  static Future<void> insertUser(ProgressModel user) async {
    final dbs = await DBHelper.db();
    await dbs.insert('progress', user.toMap());
  }

  static Future<List<ProgressModel>> getAllUser() async {
    final dbs = await DBHelper.db();
    final results = await dbs.query('progress');
    return results.map((e) => ProgressModel.fromMap(e)).toList();
  }

  static Future<int> updateUser(ProgressModel user) async {
    final dbs = await DBHelper.db();

    if (user.id == null) {
      throw Exception("ID wajib ada");
    }

    return dbs.update(
      'progress',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<int> deleteUser(int id) async {
    final dbs = await DBHelper.db();

    return dbs.delete('progress', where: 'id = ?', whereArgs: [id]);
  }
}
