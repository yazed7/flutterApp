import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


//Singleton Pattern(Private Constructor + Static Final Instance)

class DatabaseHelper {
  //defines a static final instance of DatabaseHelper called user,
  //user is created using the private constructor,
  //this ensures that there is exactly one instance of DatabaseHelper that is created and shared throughout the application
  static final DatabaseHelper user = DatabaseHelper._privateConstructor();
  static Database? _database;

  // Only this class can create its instance
  DatabaseHelper._privateConstructor();

    static const String TABLE_USERS = "users";

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _openDatabase();
    return _database!;
  }

  Future<Database> _openDatabase() async {
    String path = join(await getDatabasesPath(), 'user.db');

    return await openDatabase(path, version: 1, onCreate: _createDB,onUpgrade: _upgradeDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $TABLE_USERS(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    await db.execute('DROP TABLE $TABLE_USERS');

    await _createDB(db, newVersion);
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await user.database;
    return await db.insert(TABLE_USERS, row);
  }

//for user logging
  Future<Map<String, dynamic>?> getUser(String email) async {
    Database db = await user.database;
    List<Map<String, dynamic>> users =
        await db.query(TABLE_USERS, where: 'email = ?', whereArgs: [email]);
    return users.isNotEmpty ? users.first : null;
  }

//for show users
  Future<List<Map<String, dynamic>>> getAllUsers() async {
  Database db = await user.database;
  return await db.query(TABLE_USERS);
}

Future<int> deleteUser(String email) async {
  Database db = await user.database;
  return await db.delete(TABLE_USERS, where: 'email = ?', whereArgs: [email]);
}

  
}
