import 'package:flutter_application_1/day%2016/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  //FUNGSI MEMBUAT DATABASE
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'my_fitGuide.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)'
        );
      },
      version: 1
    );
  }
  //FUNGSI UNTUK MENARIK DATA DARI ATAS DAN MEMASUKAN KE DATABASE
  static Future<void> registUser(UserModel user)async{
    final dbs = await db();
    await dbs.insert('user', user.toMap()); //dbs.insert untuk memposting data ke database
  }
  static Future<UserModel?> loginUser ({
    required String email, 
    required String password
    }) async {
      final dbs = await db();
      final List<Map<String, dynamic>> results = await dbs.query(
        "user",
        where: 'email = ? AND password = ?',
        whereArgs: [email,password],
      );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }
}