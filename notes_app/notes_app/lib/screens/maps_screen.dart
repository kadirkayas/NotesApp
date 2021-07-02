import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  Set<Marker> _markers = HashSet<Marker>();
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Harita"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
          child: GoogleMap(
            onMapCreated: _mapCreated,
            markers: _markers,
            initialCameraPosition:
                CameraPosition(target: LatLng(38.491852, 27.706244), zoom: 15),
          ),
        ))
      ],
    );
  }

  void _mapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("0"),
        position: LatLng(38.491852, 27.706244),
        infoWindow: InfoWindow(
            title: "Hasan Ferdi Turgutlu Teknoloji Fakultesi",
            snippet: "Yazılım Mühendisliği"),
      ));
    });
  }
}
