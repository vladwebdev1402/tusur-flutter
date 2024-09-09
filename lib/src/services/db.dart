import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const int dbVersion = 1;
const String tableName = "Equation";

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
    return await openDatabase(path, version: dbVersion, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute("""
      CREATE TABLE Equation(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      coefA FLOAT NOT NULL,
      coefB FLOAT NOT NULL,
      coefC FLOAT NOT NULL,
      d FLOAT NOT NULL,
      x1 FLOAT NULL,
      x2 FLOAT NULL
    );
    """);
  }

  Future<void> addEquation(Map<String, dynamic> equation) async {
    Database db = await database;
    await db.insert(tableName, equation);
  }

  Future<List<Map<String, dynamic>>> getEquations() async {
    Database db = await database;
    final List<Map<String, dynamic>> data = await db.query(tableName);
    return data;
  }
}
