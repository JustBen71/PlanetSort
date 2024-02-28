import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planetsort/component/planetsort_button.dart';
import 'package:planetsort/component/planetsort_text_normal.dart';
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

  Future<List<dynamic>> fetchRecyclingCenters(
      double latitude, double longitude) async {
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

    // Checks if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, do not continue
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we have permission, we get the current position
    final position = await Geolocator.getCurrentPosition();
    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
    });
    fetchRecyclingCenters(currentPosition!.latitude, currentPosition!.longitude)
        .then((centers) {
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
                    )),
                    backgroundColor: green,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              "Name : ${center["tags"]["name"] ?? "Unknown sorting center"}",
                              style: const TextStyle(
                                fontFamily: 'RockNRoll',
                                color: beige,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.justify,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ))
                          ],
                        ),
                        const Row(
                          children: [
                            SingleChildScrollView(
                              child: PlanetSortText(
                                  data: "Location :",
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () => {
                                      launchUrlString(
                                          "https://www.google.com/maps/search/?api=1&query=${center['lat']},${center['lon']}")
                                    },
                                child: Text(
                                  "${center['lat']}, ${center['lon']}",
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                    fontFamily: 'RockNRoll',
                                    color: Colors.blue,
                                  ),
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SingleChildScrollView(
                              child: PlanetSortText(
                                  data: "Cans Recycling",
                                  textAlign: TextAlign.left),
                            ),
                            Icon(
                              center['tags']['recycling:cans'] == 'yes'
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: beige,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SingleChildScrollView(
                              child: PlanetSortText(
                                  data: "Papers Recycling",
                                  textAlign: TextAlign.left),
                            ),
                            Icon(
                              center['tags']['recycling:paper'] == 'yes'
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: beige,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SingleChildScrollView(
                              child: PlanetSortText(
                                  data: "Plastics Recycling",
                                  textAlign: TextAlign.left),
                            ),
                            Icon(
                              center['tags']['recycling:plastic'] == 'yes'
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: beige,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SingleChildScrollView(
                              child: PlanetSortText(
                                  data: "Glass Recycling",
                                  textAlign: TextAlign.left),
                            ),
                            Icon(
                              center['tags']['recycling:glass_bottles'] == 'yes'
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: beige,
                            )
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      PlanetSortButton(
                        onPressed: () => Navigator.of(context).pop(),
                        label: 'Close',
                      )
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
          child: const Icon(
            Icons.location_pin,
            color: dark,
          ),
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
              initialCenter: currentPosition!,
              initialZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              MarkerLayer(markers: markers),
            ],
          );
  }
}
