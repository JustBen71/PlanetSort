import 'package:flutter/material.dart';
import 'package:planetsort/component/planetsort_text_normal.dart';
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
        centerTitle: true,
        backgroundColor: green,
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Column(
          children: [
            Row(
              children: [
                PlanetSortText(
                  data: "Here you will find our different partners and thier offers", 
                  fontSize: paragraph,
                )
              ],
            )
        ],)
      )
    );
  }
}