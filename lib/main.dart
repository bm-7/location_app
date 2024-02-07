import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homemap(),
    );
  }
}

class Homemap extends StatefulWidget {
  const Homemap({Key? key}) : super(key: key);

  @override
  State<Homemap> createState() => _HomemapState();
}

class _HomemapState extends State<Homemap> {
  Completer<GoogleMapController> _googleMapControllerCompleter =
      Completer<GoogleMapController>();

  static const CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(12.9388, 77.6104), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getMaps(),
    );
  }

  Widget getMaps() {
    return GoogleMap(
      initialCameraPosition: _cameraPosition,
      mapType: MapType.satellite,
      onMapCreated: (GoogleMapController controller) {
        _googleMapControllerCompleter.complete(controller);
      },
    );
  }
}
