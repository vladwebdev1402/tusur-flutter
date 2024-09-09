import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const int db_version = 1;

class DBProvier {
  DBProvier._();

  static final DBProvier db = DBProvier._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}coef.db";
    return await openDatabase(path, version: db_version, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute("""
      CREATE TABLE Equation(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      coefA FLOAT,
      coefB FLOAT,
      coefC FLOAT,
    )
                """);
  }
}
