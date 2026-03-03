import 'package:flutter_application_1/Tugas%2011%20Flutter/database/sqflite.dart';
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
}
