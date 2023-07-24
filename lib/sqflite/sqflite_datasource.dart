import 'package:playground_flutter_app/sqflite/config/database_config.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatasource {
  final Future<Database> _database = DatabaseConfig.instance.database;

  Future<int> insert(dynamic object) async {
    final db = await _database;
    final result = await db.insert('EPISODE_INFO', object.toMap());
    // final result = await db.insert(object.runtimeType.toString(), object.toMap());
    return result;
  }

  Future<List<Map<String, dynamic>>> retrieveAll({required String table}) async {
    final db = await _database;
    return db.query(table);
  }

  Future<Map<String, dynamic>?> retrieve(
      {required String table,
      required String field,
      required String arg}) async {
    var db = await _database;
    var results = await db.query(table, where: 'id = ?', whereArgs: [arg]);
    if (results.isEmpty) {
      return null;
    }
    return results.first;
  }

  Future<int> update(dynamic object) async {
    var db = await _database;
    var result = await db.update(object.runtimeType.toString(), object.toMap(),
        where: 'id = ?', whereArgs: [object.id]);
    return result;
  }

  Future<int> delete(int id, String tableName) async {
    var db = await _database;
    int result = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return result;
  }
}
