import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  String title = "", note = "";
  bool saved;

  _veriKaydet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(title!=""||note!=""){
      setState(() {
        saved=true;
      });
      await pref.setString(title, note);
      print("Kaydedildi");
      Navigator.pop(context);
    }
    else{
      print("Boş bırakılamaz");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        accentColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add Notes"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(17),
          child: Column(
            children: [
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Title", hintText: "Mynote"),
                onChanged: (String value) {
                  title = value;
                  print(title);
                },
              ),
              Container(
                height: 200,
                child: TextFormField(
                  maxLines: 150000,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                      labelText: "Notes", hintText: "Bla Bla..."),
                  onChanged: (String value) {
                    note = value;
                    print(note);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text("Save"),
                    color: Colors.black12, // background
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                      _veriKaydet();
                      });
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  RaisedButton(
                    child: Text("Canceled"),
                    color: Colors.black12, // background
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}