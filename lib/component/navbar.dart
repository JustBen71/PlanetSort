import 'package:flutter/material.dart';

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
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildTabItem(
              icon: Icons.home,
              index: 0,
            ),
            _buildTabItem(
              icon: Icons.shopping_cart,
              index: 1,
            ),
            const SizedBox(width: 48),
            _buildTabItem(
              icon: Icons.person,
              index: 2,
            ),
            _buildTabItem(
              icon: Icons.map,
              index: 3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildTabItem({
    required IconData icon,
    required int index,
  }) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () => _onItemTapped(index),
    );
  }
}
