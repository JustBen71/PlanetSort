import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:planetsort/component/planet_sort_geocode.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/map_app_singleton.dart';
import 'package:planetsort/utils/constant.dart';
import 'package:planetsort/view_model/map_view_model.dart';
import 'package:url_launcher/url_launcher.dart';


class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapAppSingleton appState = locator.get();
  final MapViewModel viewModel = locator.get();

  @override
  void initState() {
    super.initState();
    viewModel.setCurrentPosition();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        title: const PlanetSortTitleText(
          data: "Map",
          fontSize: sizetitle,
          color: beige,
        ),
        centerTitle: true,
        backgroundColor: green,
      ),
      body: FutureBuilder<void>(
        future: null,
        builder: (context, snapshot) {
          if (viewModel.getCurrentPosition() != null) {
            return Container(
              alignment: Alignment.center,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(viewModel.getLatitude(),viewModel.getCurrentPosition().longitude),
                  initialZoom: 11.5,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                      ),
                    ],
                  ),
                ],
              )
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}