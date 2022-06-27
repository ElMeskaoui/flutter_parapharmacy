// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapscreenState();
}

class _GoogleMapscreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];

  @override
  void initState() {
    // TODO: implement initState
    initlize();
    super.initState();
  }

  initlize() {
    Marker firstMarker = Marker(
        markerId: MarkerId('para'),
        position: LatLng(32.335086, -6.34974227),
        infoWindow: InfoWindow(title: ('Parapharmacie')),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker secondtMarker = Marker(
        markerId: MarkerId('para1'),
        position: LatLng(32.3357076, -6.3563877),
        infoWindow: InfoWindow(title: ('Paraphatmacie Mypara')),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker thirdtMarker = Marker(
        markerId: MarkerId('para2'),
        position: LatLng(32.335119, -6.3640656),
        infoWindow: InfoWindow(title: ('parapharmacie Jabalia')),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker fourhtMarker = Marker(
        markerId: MarkerId('para3'),
        position: LatLng(32.33419300, -6.35333500),
        infoWindow: InfoWindow(title: ('Parapharmacie Rabat')),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

    markers.add(firstMarker);
    markers.add(secondtMarker);
    markers.add(thirdtMarker);
    markers.add(fourhtMarker);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Map'),backgroundColor: Color.fromARGB(255, 124, 208, 219)),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(32.3357076, -6.3563877),
          zoom: 14.5,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers.map((e) => e).toSet(),
      ),
    );
    ;
  }
}
