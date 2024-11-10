import 'package:my_fitness_progress/src/db/db.dart';

class GenericDao {
  Future<bool> save(String avaliacao) async {
    var dbClient = await DatabaseHelper.instance;
    int id = await dbClient.rawInsert("INSERT INTO evaluations(evaluation) VALUES('$avaliacao')");
    dbClient.close();

    return id != 0;
  }

  Future<List> findAll() async {
    var dbClient = await DatabaseHelper.instance;
    var list = await dbClient.rawQuery('SELECT * FROM evaluations');
    dbClient.close();

    return list;
  }

  Future<bool> update(int id, String avaliacao) async {
    var dbClient = await DatabaseHelper.instance;
    int changes = await dbClient.rawUpdate('UPDATE evaluations set evaluation = ? WHERE id = ?', [avaliacao, id]);
    dbClient.close();

    return changes > 0;
  }

  Future<bool> delete(int id) async {
    var dbClient = await DatabaseHelper.instance;
    int del = await dbClient.rawDelete('DELETE FROM evaluations WHERE id = ?', [id]);
    dbClient.close();

    return del > 0;
  }

  Future<bool> deleteAll() async {
    var dbClient = await DatabaseHelper.instance;
    int del = await dbClient.rawDelete('DELETE FROM evaluations');
    dbClient.close();

    return del > 0;
  }

  Future createAllTables() async {
    var dbClient = await DatabaseHelper.instance;
    DatabaseHelper.createTables(dbClient);
  }

  Future close() async {
    var dbClient = await DatabaseHelper.instance;
    dbClient.close();
  }
}
