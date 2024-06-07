import 'package:my_fitness_progress/src/db/db.dart';

class GenericDao {
  GenericDao();

  Future<void> save() async {
    var dbClient = await DatabaseHelper.initDatabase();
  }

  Future<void> findAll() async {
    var dbClient = await DatabaseHelper.initDatabase();
  }

  Future<void> update() async {
    var dbClient = await DatabaseHelper.initDatabase();
  }

  Future<void> delete() async {
    var dbClient = await DatabaseHelper.initDatabase();
  }

  Future createAllTables() async {
    var dbClient = await DatabaseHelper.initDatabase();
    DatabaseHelper.createTables(dbClient);
  }

  Future close() async {
    var dbClient = await DatabaseHelper.initDatabase();
    dbClient.close();
  }
}