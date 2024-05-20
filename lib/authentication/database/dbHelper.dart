import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'your_database_name.db');

    return await openDatabase(path, version: 1, onCreate: _createDB,onUpgrade: _upgradeDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    await db.execute('DROP TABLE IF EXISTS users');

    await _createDB(db, newVersion);
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('users', row);
  }

//for user logging
  Future<Map<String, dynamic>?> getUser(String email) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> users =
        await db.query('users', where: 'email = ?', whereArgs: [email]);
    return users.isNotEmpty ? users.first : null;
  }

//for show users
  Future<List<Map<String, dynamic>>> getAllUsers() async {
  Database db = await instance.database;
  return await db.query('users');
}

Future<int> deleteUser(String email) async {
  Database db = await instance.database;
  return await db.delete('users', where: 'email = ?', whereArgs: [email]);
}

  
}
