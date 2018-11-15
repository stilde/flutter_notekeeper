import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notekeeper/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //singleton DatabaseHelper
  static Database _database; //singleton Database

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // named construcot to create instance DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // executed only once, singleton object
    }

    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database =
          await initializeDatabase(); // executed only once, singleton object
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'notes.db';
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int NewVers) async {
    var sql = '''
    CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)
    ''';
    await db.execute(sql);
  }

  //Fetch operation : get all operation from db
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var sql = '''
    SELECT * FROM $noteTable orcer by $colPriority)
    ''';

    return await db.rawQuery(sql);
  }

//insert operation
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    return await db.insert(noteTable, note.toMap()); //map object
  }

//update
  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    return await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]); //map object
  }

//delete
  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    return await db
        .rawDelete('DELETE FROM $noteTable WHERE $colId = $id'); //map object
  }

//get number of Note objects in db
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $noteTable');
    return Sqflite.firstIntValue(x);
  }
}
