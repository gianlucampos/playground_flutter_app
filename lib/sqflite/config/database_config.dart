import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;

class DatabaseConfig {
  static const String _databaseName = "generic_database.db";
  static final DatabaseConfig instance = DatabaseConfig._singleton();

  static Database? _database;

  DatabaseConfig._singleton();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(path, onCreate: _createDB, version: 1);
  }

  Future _createDB(Database db, int version) async {
    final sqlInit = await rootBundle.loadString('assets/migrations/init.sql');

    // await db.execute(sqlInit);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
