// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import '../beskrivelser/nordnes_sjobad.dart'; //for å skrive adresse til lokasjonen

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
  static const LatLng _center =
      LatLng(60.3913, 5.3221); // Koordinater for Bergen
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    const nordnesAddress = 'Nordnesparken 30, 5005 Bergen';
    final nordnesLocation = await _getCoordinates(nordnesAddress);

    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('Nordnes Sjøbad'),
          position: LatLng(nordnesLocation.latitude, nordnesLocation.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NordnesSjobad(),
              ),
            );
          },
        ),
      );
    });
  }

  Future<LatLng> _getCoordinates(String address) async {
    final locations = await locationFromAddress(address);
    return LatLng(locations.first.latitude, locations.first.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: _markers,
      ),
    );
  }
}
