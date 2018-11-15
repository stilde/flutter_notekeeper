import 'package:flutter/material.dart';
import 'note_detail.dart';
import 'dart:async';
import 'package:notekeeper/models/note.dart';
import 'package:notekeeper/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {

 

  @override
  NoteListState createState() => new NoteListState();
}

class NoteListState extends State<NoteList> {
   DatabaseHelper dbHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Notes"),
      ),
      body: getNoteList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          debugPrint("tapped FAB");
          navigateToDetail('Ajouter ');
        },
        child: new Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink[100],
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  ListView getNoteList() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return new ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int position) {
        return new Card(
            elevation: 2.0,
            child: new ListTile(
              title: new Text(
                "liste",
                style: titleStyle,
              ),
              subtitle: new Text("sous liste", style: titleStyle),
              leading: new CircleAvatar(
                  backgroundColor: Colors.deepOrangeAccent,
                  child: new Icon(Icons.keyboard_arrow_right)),
              trailing: new Icon(Icons.delete_sweep),
              onTap: () {
                navigateToDetail('Editer Note');
              }, //onTap event Handler
            ));
      },
    );
  }

  void navigateToDetail(String title) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => new DetailList(title)));
  }
}

/*   child: new ListView.builder(
          itemCount: mesActivites.length,
          itemBuilder: (context, i) {
            Activite activite = mesActivites[i];
            String key = activite.nom;

            return new Dismissible(
              key: new Key(key),
              child: new ListTile(
                title: new Text(mesActivites[i].nom),
                trailing: new Icon(mesActivites[i].icone),
              ),
              background: new Container(
                padding: EdgeInsets.only(right: 20.0),
                color: Colors.blue[200],
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text(
                      'supprimer',
                      style: new TextStyle(color: Colors.white),
                    ),
                    new Icon(Icons.delete, color: Colors.white),
                  ],
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  print(activite.nom);
                  mesActivites.removeAt(i);
                });
              },
            );
          },
        ),*/
