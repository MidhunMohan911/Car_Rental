import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late GoogleMapController myMapController;
  final Set<Marker> _markers = Set();
  static const LatLng _mainLocation = const LatLng(25.69893, 32.6421);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Maps With Marker'),
              backgroundColor: Colors.blue[900],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _mainLocation,
                      zoom: 10.0,
                    ),
                    markers: this.myMarker(),
                    mapType: MapType.normal,
                    onMapCreated: (controller) {
                      setState(() {
                        myMapController = controller;
                      });
                    },
                  ),
                ),
              ],
            )));
  }

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_mainLocation.toString()),
        position: _mainLocation,
        infoWindow: InfoWindow(
          title: 'Historical City',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    return _markers;
  }
}
