import 'package:flutter/material.dart';
import 'package:planetsort/utils/constant.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: green),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: green),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: green),
            label: 'Map',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: beige,
        unselectedItemColor: green.withOpacity(0.6),
        selectedLabelStyle: const TextStyle(color: green),
      ),
      floatingActionButton: SizedBox(
        height: 80.0,
        width: 80.0,
        child: FittedBox(
            child: FloatingActionButton(
          backgroundColor: green,
          elevation: 4.0,
          onPressed: () {},
          shape: const CircleBorder(),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          child: const Icon(Icons.camera_alt, size: 24.0, color: beige),
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
