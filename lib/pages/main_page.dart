import 'package:flutter/material.dart';
import 'package:planetsort/component/planetsort_custom_navbar.dart';
import 'package:planetsort/pages/edit_profile_page.dart';
import 'package:planetsort/pages/home_page.dart';
import 'package:planetsort/routes/router.dart';
import 'package:planetsort/utils/constant.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndexMainView = 1;

  @override
  Widget build(BuildContext context) {
    print(selectedIndexMainView);
    return Scaffold(
      backgroundColor: green,
      body: _selectedView(selectedIndexMainView),
      bottomNavigationBar: PlanetSortCustomNavBar(
          currentIndex: selectedIndexMainView,
          selectNavBarItem: (index) {
            setState(() {
              selectedIndexMainView = index;
            });
          }
        ),
    );
  }

  Widget _selectedView(currentIndex){
    switch(currentIndex)
    {
      case 0: return HomePage();

      case 1: return HomePage();

      case 2: return HomePage();

      case 3: return EditProfilePage();

      case 4: return HomePage();

      default : return HomePage();
    }
  }
}