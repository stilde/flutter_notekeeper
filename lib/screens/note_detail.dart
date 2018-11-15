import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notekeeper/models/note.dart';
import 'package:notekeeper/utils/database_helper.dart';
import 'package:intl/intl.dart';

class DetailList extends StatefulWidget {

  String title;
  DetailList(this.title);
  @override
  DetailListState createState() {
    // TODO: implement createState

    return new DetailListState(this.title);
  }
}

class DetailListState extends State<DetailList> {
  String title;
  static var _priorite = ["Haute", "Basse"];
  TextEditingController titleCtrler = new TextEditingController();
  TextEditingController descriptionCtrler = new TextEditingController();

  DetailListState(this.title);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return new WillPopScope(
      onWillPop: (){
 movetoLastScreen();
      },
    child: new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
        leading: IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){
            movetoLastScreen();
          }          
        ),
        actions: <Widget>[],
      ),
      body: new Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: new ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            new ListTile(
                title: new DropdownButton(
              items: _priorite.map((String drop) {
                return DropdownMenuItem<String>(
                    value: drop, child: new Text(drop));
              }).toList(),
              style: textStyle,
              value: _priorite[1],
              onChanged: (selection) {
                setState(() {
                  debugPrint('userselection = $selection');
                });
              },
            )),
            new Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: new TextField(
                controller: titleCtrler,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in title');
                },
                decoration: new InputDecoration(
                    labelText: "Titre",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: new TextField(
                controller: descriptionCtrler,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in desc');
                },
                decoration: new InputDecoration(
                    labelText: "Description",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: new Text("Sauvegarder", textScaleFactor: 1.2),
                      onPressed: () {
                        setState(() {
                          debugPrint('sauvegarde button clicked');
                        });
                      },
                    ),
                  ),
                  new Container(width: 3.0),
                  new Expanded(
                    child: new RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: new Text("Détruire", textScaleFactor: 1.2),
                      onPressed: () {
                        setState(() {
                          debugPrint('delete button clicked');
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )
    );
  }

  void movetoLastScreen(){
    Navigator.pop(context);
  }

  padding() {
    return new Padding(
      padding: EdgeInsets.all(10.0),
    );
  }
}
