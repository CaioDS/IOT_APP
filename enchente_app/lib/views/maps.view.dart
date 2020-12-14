import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:enchente_app/src/locations.dart' as locations;

class MapsView extends StatefulWidget {
  MapsView({Key key}) : super(key: key);
  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("tereza"),
        position: LatLng(-19.9825479, -44.0334033),
        infoWindow: InfoWindow(
          title: "Tereza Cristina",
          snippet: "Aqui tem um marcador",
        ),
      );
       _markers["tereza"] = marker;
      /*for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Areas'),
          backgroundColor: Colors.green[700],
          actions: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context), alignment: Alignment.centerLeft,)
          ],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(0, 0),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}

