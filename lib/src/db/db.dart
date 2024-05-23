import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _instance;

  static const String _dbName = "fitness.db";
  static const int _dbVersion = 1;
  static const String _users = "CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, height TEXT, weight TEXT);";
  static const String _evaluations = "CREATE TABLE IF NOT EXISTS evaluations (id INTEGER PRIMARY KEY AUTOINCREMENT, shoulder TEXT, chest TEXT, right_arm TEXT, left_arm TEXT, forearm_right TEXT, forearm_left TEXT, waist TEXT, stomach TEXT, hip TEXT, right_thigh TEXT, left_thigh TEXT, calf_right TEXT, calf_left TEXT);";

  static const List<Map<String, String>> tableData = [
    {"name": "users", "sql": _users},
    {"name": "evaluations", "sql": _evaluations},
  ];

  static initDatabase() async {
    String databasePath = await getDatabasesPath();
    
    return await openDatabase("$databasePath/$_dbName", version: _dbVersion, onCreate: onCreate);
  }

  Future<Database> get instance async {
    _instance ??= initDatabase();
    return _instance!;
  }

  static Future createTables(Database db) async {
    for (var table in tableData) {
      await db.execute(table["sql"]!);
    }
  }

  static Future<void> onCreate(Database db, int version) async {
    await createTables(db);
  }
}