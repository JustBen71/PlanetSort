import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planetsort/component/planetsort_text_normal.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/utils/constant.dart';

import 'package:url_launcher/url_launcher_string.dart';

import 'package:http/http.dart' as http;

class LocationMapWidget extends StatefulWidget {
  @override
  _LocationMapWidgetState createState() => _LocationMapWidgetState();
}

class _LocationMapWidgetState extends State<LocationMapWidget> {
  MapController mapController = MapController();
  LatLng? currentPosition;

  List<Marker> markers = [];  

  Future<List<dynamic>> fetchRecyclingCenters(double latitude, double longitude) async {
    final query = """
    [out:json];
    (
      node["amenity"="recycling"](around:50000,$latitude,$longitude);
    );
    out;
    """;
    
    final response = await http.post(
      Uri.parse('https://overpass-api.de/api/interpreter'),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {"data": query},
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data["elements"];
    } else {
      throw Exception('Failed to load recycling centers');
    }
  }

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
    });
    fetchRecyclingCenters(currentPosition!.latitude, currentPosition!.longitude).then((centers) {
      setState(() {
        markers = centers.map((center) {
          return Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(center["lat"], center["lon"]),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Center(
                      child: Text(
                        "Sorting center",
                        style: TextStyle(
                          fontFamily: 'RockNRoll',
                          color: beige,
                        ),
                      )
                    ), 
                    backgroundColor: green,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                PlanetSortText(data: "Name: ${center["tags"]["name"] ?? "Unknown sorting center"}"),
                              ]
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => {launchUrlString("https://www.google.com/maps/search/?api=1&query=${center['lat']},${center['lon']}")},
                                  child: Text(
                                    "Location : ${center['lat']},${center['lon']}",
                                    style: const TextStyle(
                                      fontFamily: 'RockNRoll',
                                      color: Colors.blue,
                                    ),
                                  )
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const PlanetSortText(data: "Cans Recycling ", ),
                                Icon(
                                  center['tags']['recycling:cans'] == 'yes' ? Icons.check_box : Icons.check_box_outline_blank,
                                  color: beige,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const PlanetSortText(data: "Papers Recycling ", ),
                                Icon(
                                  center['tags']['recycling:paper'] == 'yes' ? Icons.check_box : Icons.check_box_outline_blank,
                                  color: beige,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const PlanetSortText(data: "Plastics Recycling ", ),
                                Icon(
                                  center['tags']['recycling:plastic'] == 'yes' ? Icons.check_box : Icons.check_box_outline_blank,
                                  color: beige,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const PlanetSortText(data: "Glass Recycling ", ),
                                Icon(
                                  center['tags']['recycling:glass_bottles'] == 'yes' ? Icons.check_box : Icons.check_box_outline_blank,
                                  color: beige,
                                )
                              ],
                            ),
                          ],
                        ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          "Close",
                          style: TextStyle(
                            fontFamily: 'RockNRoll',
                            color: beige,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(Icons.recycling, color: green),
            ),
          );
        }).toList();
        markers.add(Marker(
                width: 80.0,
                height: 80.0,
                point: currentPosition!, 
                child: const Icon(Icons.location_pin, color: dark, ),
              ));
      });
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
            markers: markers
          ),
        ],
      );
  }
}