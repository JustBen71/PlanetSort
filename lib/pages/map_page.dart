import 'package:flutter/material.dart';
import 'package:planetsort/component/planet_sort_map.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/utils/constant.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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
        body: Column(children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlanetSortTitleText(
                  data: "Different waste sorting point around you"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 520,
                width: 350,
                child: LocationMapWidget(),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.recycling,
                color: beige,
              ),
              SizedBox(width: 5.0), // Space between icon and text
              Text(
                ": Sorting center",
                style: TextStyle(
                  fontFamily: 'RockNRoll',
                  color: beige,
                ),
              ),
            ],
          ),
        ]));
  }
}
