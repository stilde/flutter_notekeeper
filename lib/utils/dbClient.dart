import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notekeeper/models/item.dart';

class DatabaseClient {
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      return _database = await create();
      
    }
  }

  Future<Database> create() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String database_directory = join(directory.path, 'database.db');
    var bdd = await openDatabase(database_directory, version: 1, onCreate: null);
    return bdd;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE item (
      id INTEGER PRIMARY KEY,
      nom TEXT NOT NULL)    
    ''');
  }

/* ecriture*/

  Future<Item> ajoutItem (Item item) async {
     Database maDb = await database; 
     item.id = await maDb.insert('item', item.toMap());
     return item;

  }

  /* lecture*/
}
