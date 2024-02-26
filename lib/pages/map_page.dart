import 'package:flutter/material.dart';
import 'package:planetsort/component/planet_sort_map.dart';
import 'package:planetsort/component/planetsort_text_normal.dart';
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
        child: Column(
          children: [
            const Row(
              children: [
                PlanetSortTitleText(data: "Different waste sorting point around you"),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 550,
                  width: 350,
                  child: LocationMapWidget(),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5),),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.recycling,
                  color: beige,
                ),
                SizedBox(width: 5), // Espace entre l'icône et le texte
                Text(
                  ": Sorting center",
                  style: TextStyle(
                    fontFamily: 'RockNRoll',
                    color: beige,
                  ),
                ),
              ],
            )
          ]
        )
      )
    );
  }
}