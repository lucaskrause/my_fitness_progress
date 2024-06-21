import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _instance;

  static const String _dbName = "fitness.db";
  static const int _dbVersion = 1;
  static const String _evaluations =
      "CREATE TABLE IF NOT EXISTS evaluations (id INTEGER PRIMARY KEY AUTOINCREMENT, evaluation TEXT);";

  static const List<Map<String, String>> tableData = [
    {"name": "evaluations", "sql": _evaluations},
  ];

  static Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();

    _instance = await openDatabase("$databasePath/$_dbName",
        version: _dbVersion, onCreate: onCreate);

    return _instance!;
  }

  static Future<Database> get instance async {
    _instance ??= await initDatabase();
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
