import 'package:flutter/material.dart';
import 'package:planetsort/utils/constant.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';


class PlanetSortCustomNavBar extends StatefulWidget {
  const PlanetSortCustomNavBar({super.key});

  @override
  State<PlanetSortCustomNavBar> createState() => _PlanetSortCustomNavBarState();
}

class _PlanetSortCustomNavBarState extends State<PlanetSortCustomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return
      ConvexAppBar(
        color: green,
        style: TabStyle.fixedCircle,
        backgroundColor: beige,
        activeColor: green,
        cornerRadius: 30,
        height: 70,
        items: [
          TabItem(
          icon: Icon((_selectedIndex == 0 ? Icons.home : Icons.home_outlined), color: green,),
          title: "Home",
        ),
        TabItem(
          icon: Icon((_selectedIndex == 1 ? Icons.shopping_cart : Icons.shopping_cart_outlined), color: green),
          title: "Market"
        ),
        TabItem(
          icon: Icon((_selectedIndex == 2 ? Icons.camera_alt : Icons.camera_alt_outlined), color: beige),
          title: "", 
        ),
        TabItem(
          icon: Icon((_selectedIndex == 3 ? Icons.person_2 : Icons.person_2_outlined), color: green),
          title: "Profile"
        ),
        TabItem(
          icon: Icon((_selectedIndex == 4 ? Icons.map : Icons.map_outlined), color: green),
          title: "Map"
        ),
      ],
      initialActiveIndex: _selectedIndex,
      onTap: (int i) => setState(() {
        _selectedIndex = i;
      }),
      
      /*
        backgroundColor: beige,
        currentIndex: _selectedIndex,    
        selectedItemColor: green,
        selectedLabelStyle: const TextStyle(color: green),
        unselectedLabelStyle: const TextStyle(color: dark),
        unselectedItemColor: dark,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
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
      ],                                                                       
    */);
  }
}