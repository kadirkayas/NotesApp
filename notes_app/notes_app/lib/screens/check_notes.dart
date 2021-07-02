import 'package:flutter/material.dart';
import 'package:notes_app/screens/update_notes.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool dondu = false;

class CheckNotes extends StatefulWidget {
  String title, note = "", text;
  CheckNotes({this.title, this.text});
  @override
  _CheckNotesState createState() => _CheckNotesState();
}

class _CheckNotesState extends State<CheckNotes> {
  _veriOku() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.note = prefs.getString(widget.title);
      print(widget.note);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (dondu == false) {
      setState(() {
        _veriOku();
      });
      dondu = true;
      print(dondu.toString());
      print("deneme");
    }
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        accentColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title.toUpperCase()),
          centerTitle: true,
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 555,
              child: SingleChildScrollView(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 2)),
                    color: Colors.black12, // background
                    textColor: Colors.white,
                    child: Row(
                      children: [
                        Icon(Icons.update),
                        Text('Update',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateNotes(
                                  title: widget.title, text: widget.text)));
                    },
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 2)),
                    color: Colors.black12, // background
                    textColor: Colors.white,
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        Text('Delete',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center),
                      ],
                    ), // foreground
                    onPressed: () {
                      setState(() {
                        _veriSil();
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _veriSil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(widget.title);
  }
}
