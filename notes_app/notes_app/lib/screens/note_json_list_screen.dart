import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app/data.api/note_api.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/widgets/note_tap_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';

class NoteJsonListScreen extends StatefulWidget {
  @override
  _NoteJsonListScreenState createState() => _NoteJsonListScreenState();
}

class _NoteJsonListScreenState extends State {
  bool jsonNoteAdd = false;
  var notes = [];
  Note selectedNote = Note("", "");
  @override
  void initState() {
    getNoteFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, jsonNoteAdd);
        return new Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dışardan Gelen Notlarım"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    getNoteFromApi();
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              selected: true,
              title: Text(notes[index].noteTitle),
              onTap: () {
                setState(() {
                  selectedNote = notes[index];
                });
              },
              onLongPress: () {
                var alert = NoteAlertDialog(notes[index]);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
            );
          },
        )),
        Center(
          child: Text("En Son Seçilen: " + selectedNote.noteTitle),
        ),
        Row(
          children: [
            Padding(padding: new EdgeInsets.all(10.0)),
            Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: ElevatedButton(
                    child: Text("Notlarıma Ekle"),
                    onPressed: () {
                      _veriKaydet();
                    })),
            Padding(padding: new EdgeInsets.all(10.0)),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    child: Text("Sil"),
                    onPressed: () {
                      setState(() {
                        NoteApi.deleteNotes(selectedNote.jsonId);
                        notes.remove(selectedNote);
                      });
                    })),
            Padding(padding: new EdgeInsets.all(10.0))
          ],
        )
      ],
    );
  }

  void getNoteFromApi() {
    NoteApi.getNotes().then((data) {
      setState(() {
        Iterable list = json.decode(data.body);
        this.notes.clear();
        this.notes = list.map((note) => Note.fromJson(note)).toList();
        if (notes.isNotEmpty) {
          selectedNote = notes[0];
        }
      });
    });
  }

  _veriKaydet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (selectedNote.noteTitle != "" || selectedNote.noteBody != "") {
      await pref.setString(selectedNote.noteTitle, selectedNote.noteBody);
      print("Kaydedildi");
      jsonNoteAdd = true;
      setState(() {
        NoteApi.deleteNotes(selectedNote.jsonId);
        notes.remove(selectedNote);
        if (notes.isNotEmpty)
          selectedNote = notes[0];
        else
          selectedNote = Note("", "");
      });
    } else {
      print("Boş bırakılamaz");
    }
  }
}
