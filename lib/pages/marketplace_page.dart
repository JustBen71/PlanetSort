import 'package:flutter/material.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/utils/constant.dart';

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        title: const PlanetSortTitleText(
          data: "Marketplace",
          fontSize: sizetitle,
          color: beige,
        ),
        backgroundColor: green,
      ),
      //body: 
    );
  }
}