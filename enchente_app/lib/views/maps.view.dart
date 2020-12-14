import 'dart:async';
import 'package:enchente_app/models/Area.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:enchente_app/src/locations.dart' as locations;
import 'package:enchente_app/controllers/area.controller.dart';

class MapsView extends StatefulWidget {
  MapsView({Key key}) : super(key: key);
  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {

  AreaController _controller = new AreaController();
  var _list = List<Area>();
  
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.getAll().then((data) {
        setState(() {
          _list = _controller.list;
        });
      });
    });
  }

  final Map<String, Marker> _markers = {};
   Set<Polygon> _polygns = Set<Polygon>();
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();

      final marcadores = [
        new LatLng(-19.9825479, -44.0334033),
        new LatLng(-19.9249157,-43.9927343),
        new LatLng(-19.9262669,-43.9808317),
      ];

      _polygns.add(Polygon(
        polygonId: PolygonId("Area1"),
        points: marcadores,
        strokeWidth: 2,
        strokeColor: Colors.green.withOpacity(0.2),
        fillColor: Colors.green.withOpacity(0.2),

      ));
      
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
    Set<Circle> circles = Set.from([Circle(
        circleId: CircleId("tereza cristina"),
        center: LatLng(-19.9825479, -44.0334033),
        radius: 1000,
        fillColor: Colors.cyan.withOpacity(0.1),
        strokeColor: Colors.cyan.withOpacity(0.1),
    )]);

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
          polygons: _polygns,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: const LatLng(0, 0),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
          circles: circles,
        ),
      ),
    );
  }
}

