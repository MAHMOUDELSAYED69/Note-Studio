import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDatabase {
  static final SqlDatabase _instance = SqlDatabase._internal();
  static Database? _db;

  factory SqlDatabase() {
    return _instance;
  }

  SqlDatabase._internal();

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initializeDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> _initializeDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'notes_studio.db');
    Database mydb = await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
    return mydb;
  }

  Future<void> deleteAndRecreateDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'notes_studio.db');
    await deleteDatabase(path);
  }

  Future<void> _onCreate(Database db, int version) async {
    //? Create 'notes' table
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        creationDate TEXT NOT NULL,
        lastModifiedDate TEXT NOT NULL
      )
    ''');

    log("DB Created!");
  }

  Future<List<Map<String, dynamic>>?> readData({required String data}) async {
    Database? mydb = await db;
    List<Map<String, dynamic>>? response = await mydb?.rawQuery(data);
    return response;
  }

  Future<int?> insertData({required String data}) async {
    Database? mydb = await db;
    int? response = await mydb?.rawInsert(data);
    return response;
  }

  Future<int?> updateData({required String data}) async {
    Database? mydb = await db;
    int? response = await mydb?.rawUpdate(data);
    return response;
  }

  Future<int?> deleteData({required String data}) async {
    Database? mydb = await db;
    int? response = await mydb?.rawDelete(data);
    return response;
  }

  Future<void> initializeDatabase() async {
    await db;
  }
}
