import 'package:flutter/material.dart';
import 'screens/note_list.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
   return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text('CARNET DE NOTES',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.asset('assets/img/splash.png'),
    
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Stilde"),
      loaderColor: Colors.red
    );
    
  }
}
 
    
    class AfterSplash extends StatelessWidget {
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