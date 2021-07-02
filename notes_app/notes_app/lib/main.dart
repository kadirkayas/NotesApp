import 'package:flutter/material.dart';
import 'package:notes_app/screens/main_screen.dart';

void main() {
  runApp(MaterialApp(home: MyNotes()));
}

class MyNotes extends StatefulWidget {
  @override
  _MyNotesState createState() => _MyNotesState();
}

class _MyNotesState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.amber,
          accentColor: Colors.white,
        ),
        home: MainScreen());
  }
}
