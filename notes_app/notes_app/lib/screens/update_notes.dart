import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String note;
class UpdateNotes extends StatefulWidget {
  String title, text;
  UpdateNotes({this.title, this.text});
  @override
  _UpdateNotesState createState() => _UpdateNotesState();
}

class _UpdateNotesState extends State<UpdateNotes> {
  _veriKaydet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(widget.title, note);
    print(note);
    print("Güncellendi");
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
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(17),
          child: Column(
            children: [
              Container(
                height: 200,
                child: TextFormField(
                  maxLines: 150000,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: "Notes", hintText: ""),
                  onChanged: (String value) {
                    note = value;
                    print(note);
                  },
                ),
              ),
              Row(
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
                        _veriKaydet();
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
                          Icon(Icons.call_missed),
                          Text('Canceled',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
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
