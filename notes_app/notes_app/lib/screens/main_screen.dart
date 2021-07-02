import 'package:flutter/material.dart';
import 'package:notes_app/screens/add_notes.dart';
import 'package:notes_app/screens/check_notes.dart';
import 'package:notes_app/screens/diger.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

void main() {
  runApp(MaterialApp(home: MainScreen()));
}

List<String> notes = [""];
String noteindex, notetext;

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State {
  String title = "dede", yazi = "dede";
  @override
  Widget build(BuildContext context) {
    setState(() {
      allKeys();
    });
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        accentColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Notes"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(notes[index]),
                      leading: CircleAvatar(
                        child: const Icon(Icons.chrome_reader_mode),
                      ),
                      onTap: () {
                        _veriOku();
                        noteindex = notes[index];
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckNotes(
                                        title: notes[index],
                                        text: notetext,
                                      )));
                        });
                      },
                    );
                  }),
            ),
            RaisedButton(
                child: Text("Diger seyler"),
                onPressed: () {
                  _goToOthers();
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.note_add),
          backgroundColor: Colors.green,
          onPressed: () {
            print("basildi");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddNotes()));
          },
        ),
      ),
    );
  }

  _veriOku() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notetext = prefs.getString(noteindex);
    });
  }

  Future<Set<String>> allKeys() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notes = prefs.getKeys().toList();
    });
    return prefs.getKeys();
  }

  // bir not eklenince addNote ekranından true değeri dönüyor. ve notes dizisi güncellenince notlar ekranıda güncelleniyor
  _goToOthers() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Diger()));
    if (result) {
      allKeys();
    }
  }
}
