import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notekeeper/models/note.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper; //singleton DatabaseHelper

  DatabaseHelper._createInstance();

  factory DatabaseHelper(){

    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // executed only once, singleton object
    }

    return _databaseHelper;
  } 

}