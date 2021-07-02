import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

class NoteAlertDialog extends StatefulWidget {
  Note note;
  NoteAlertDialog(this.note);
  @override
  _NoteAlertDialogState createState() => _NoteAlertDialogState(note);
}

class _NoteAlertDialogState extends State {
  Note note;
  _NoteAlertDialogState(this.note);
  @override
  Widget build(BuildContext context) {
    return showAlertDialog(context, note);
  }

  showAlertDialog(BuildContext context, Note note) {
    // set up the buttons
    Widget abourtButton = TextButton(
      child: Text("Cik"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(note.noteTitle + " Notu"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(note.noteBody),
          ],
        ),
      ),
      actions: [
        abourtButton,
      ],
    );
    return alert;
    // show the dialog
  }
}
