import 'package:flutter/material.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/utils/constant.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

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
        backgroundColor: green,
      ),
      //body: 
    );
  }
}