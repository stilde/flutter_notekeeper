import 'package:flutter/material.dart';
import 'screens/note_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carnet de notes',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new NoteList(),
    );
  }
}