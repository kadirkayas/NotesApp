import 'package:flutter/material.dart';
import 'package:notes_app/screens/maps_screen.dart';
import 'package:notes_app/screens/note_json_list_screen.dart';
import 'package:notes_app/screens/video_player_screen.dart';
import 'package:notes_app/widgets/local_notification.dart';

class Diger extends StatefulWidget {
  @override
  DigerState createState() => DigerState();
}

class DigerState extends State<Diger> {
  bool jsonNoteAdd = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, jsonNoteAdd);
        return new Future(() => false);
      },
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("Diğer"),
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
              expandedHeight: 50,
              pinned: true,
            ),
            SliverList(delegate: SliverChildListDelegate(listElements()))
          ],
        ),
      ),
    );
  }

  List<Widget> listElements() {
    return [
      Container(
          margin:
              EdgeInsets.only(left: 40.0, top: 10.0, right: 40.0, bottom: 10.0),
          child: RaisedButton(
            color: Colors.black12, // background
            textColor: Colors.white, // foreground
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapsScreen()));
            },
            child: Text('Harita',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          )),
      Container(
          margin:
              EdgeInsets.only(left: 40.0, top: 10.0, right: 40.0, bottom: 10.0),
          child: RaisedButton(
            color: Colors.black12, // background
            textColor: Colors.white, // foreground
            onPressed: () {
              _goToJsonList();
            },
            child: Text('Çekilen Veri',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          )),
      Container(
          margin:
              EdgeInsets.only(left: 40.0, top: 10.0, right: 40.0, bottom: 10.0),
          child: RaisedButton(
            color: Colors.black12, // background
            textColor: Colors.white, // foreground
            onPressed: () {
              LocalNotification();
            },
            child: Text('Bildirim',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          )),
      Container(
          margin:
              EdgeInsets.only(left: 40.0, top: 10.0, right: 40.0, bottom: 10.0),
          child: RaisedButton(
            color: Colors.black12, // background
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VideoPlayer()));
            },
            child: Text('Video Oynatma',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          )),
    ];
  }

  _goToJsonList() async {
    jsonNoteAdd = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => NoteJsonListScreen()));
  }
}
