import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planetsort/utils/constant.dart';

class LocationMapWidget extends StatefulWidget {
  @override
  _LocationMapWidgetState createState() => _LocationMapWidgetState();
}

class _LocationMapWidgetState extends State<LocationMapWidget> {
  MapController mapController = MapController();
  LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Vérifie si les services de localisation sont activés
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Les services de localisation ne sont pas activés, ne continuez pas
      return Future.error('Les services de localisation sont désactivés.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Les permissions sont refusées
        return Future.error('Les permissions de localisation sont refusées');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Les permissions sont définitivement refusées
      return Future.error(
          'Les permissions de localisation sont définitivement refusées, nous ne pouvons pas demander les permissions.');
    } 

    // Quand on a la permission, on obtient la position actuelle
    final position = await Geolocator.getCurrentPosition();
    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
      //mapController.move(currentPosition!, 15); // Zoom sur la position actuelle avec un niveau de zoom de 15
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentPosition == null
      ? const Center(child: CircularProgressIndicator())
      : FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: currentPosition,
          zoom: 15.0,
        ),
        children: [
          TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: currentPosition!, 
                child: const Icon(Icons.location_pin, color:green, ),
              ),
            ],
          ),
        ],
      );
  }
}