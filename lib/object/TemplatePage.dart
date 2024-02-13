import 'package:flutter/material.dart';

import 'package:planetsort/object/BottomAppBarItem.dart';
import 'package:planetsort/object/PlanetSortCustomNavBar.dart';
import 'package:planetsort/object/TitleText.dart';
import 'package:planetsort/utils/constant.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage(
      {super.key,
      required this.title,
      required this.column,
      required this.center});
  final String title;
  final Column column;
  final bool center;

  @override
  State<TemplatePage> createState() => _TemplatePage();
}

class _TemplatePage extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
        backgroundColor: green,
        appBar: AppBar(
          backgroundColor: green,
          title: Center(
              child: TitleText(data: widget.title, color: beige, fontSize: 50)),
        ),
        body: Center(child: widget.column),
        bottomNavigationBar: PlanetSortCustomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomAppBarItem(icon: Icons.home, label: 'Home'),
            BottomAppBarItem(icon: Icons.shopping_bag, label: 'Market'),
            BottomAppBarItem(icon: Icons.camera_alt, label: ''),
            BottomAppBarItem(icon: Icons.person, label: 'Profile'),
            BottomAppBarItem(icon: Icons.map_sharp, label: 'Map'),
          ],
        ));
  }
}
