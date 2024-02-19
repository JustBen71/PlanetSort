import 'package:flutter/material.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:planetsort/utils/constant.dart';

class PlanetSortCustomNavBar extends StatefulWidget {
  PlanetSortCustomNavBar({super.key, required this.currentIndex, required this.selectNavBarItem});

  int currentIndex;
  Function selectNavBarItem;

  @override
  State<PlanetSortCustomNavBar> createState() => _PlanetSortCustomNavBarState();
}

class _PlanetSortCustomNavBarState extends State<PlanetSortCustomNavBar> {
  late int  currentIndex;
  
  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      color: green,
      style: TabStyle.fixedCircle,
      backgroundColor: beige,
      activeColor: green,
      cornerRadius: 30,
      height: 70,
      items: [
        TabItem(
          icon: Icon(
            (currentIndex == 0 ? Icons.home : Icons.home_outlined),
            color: green,
          ),
          title: "Home",
        ),
        TabItem(
            icon: Icon(
                (currentIndex == 1
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined),
                color: green),
            title: "Market"),
        TabItem(
          icon: Icon(
              (currentIndex == 2
                  ? Icons.camera_alt
                  : Icons.camera_alt_outlined),
              color: beige),
          title: "",
        ),
        TabItem(
            icon: Icon(
                (currentIndex == 3
                    ? Icons.person_2
                    : Icons.person_2_outlined),
                color: green),
            title: "Profile"),
        TabItem(
            icon: Icon((currentIndex == 4 ? Icons.map : Icons.map_outlined),
                color: green),
            title: "Map"),
      ],
      initialActiveIndex: currentIndex,
      onTap: (int i) => setState(() {
        currentIndex = i;
        widget.selectNavBarItem(i);
      }),
    );
  }
}
