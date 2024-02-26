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
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 500,
          width: 500,
          child: LocationMapWidget()
        )
      )
    );
  }
}