import 'package:flutter/material.dart';
import 'package:planetsort/utils/constant.dart';

class PlanetSortCustomNavBar extends StatefulWidget {
  const PlanetSortCustomNavBar({super.key});

  @override
  State<PlanetSortCustomNavBar> createState() => _PlanetSortCustomNavBarState();
}

class _PlanetSortCustomNavBarState extends State<PlanetSortCustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: beige,
      selectedItemColor: green,
      unselectedItemColor: dark,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Market"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: "Map"
        ),
      ]
    );
  }
}

/*import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planetsort/object/BottomAppBarItem.dart';
import 'package:planetsort/utils/constant.dart';


class PlanetSortCustomNavBar extends StatelessWidget {
  final List<BottomAppBarItem> items = [
              BottomAppBarItem(icon: Icons.home, label: 'Home'),
              BottomAppBarItem(icon: Icons.shopping_bag, label: 'Market'),
              BottomAppBarItem(icon: Icons.camera_alt, label: ''),
              BottomAppBarItem(icon: Icons.person, label: 'Profile'),
              BottomAppBarItem(icon: Icons.map_sharp, label: 'Map')
    ];
  final int currentIndex;
  final ValueChanged<int> onTap;

  PlanetSortCustomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          return InkWell(
            onTap: () {
              onTap(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(items[index].icon,
                    color: index == currentIndex
                        ? green
                        : dark),
                Text(items[index].label,
                    style: TextStyle(
                      color: index == currentIndex
                          ? green
                          : dark,
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }
}*/