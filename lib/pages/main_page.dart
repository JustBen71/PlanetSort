import 'package:flutter/material.dart';
import 'package:planetsort/component/planetsort_custom_navbar.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/pages/edit_profile_page.dart';
import 'package:planetsort/pages/camera_page.dart';
import 'package:planetsort/pages/home_page.dart';
import 'package:planetsort/pages/map_page.dart';
import 'package:planetsort/pages/marketplace_page.dart';
import 'package:planetsort/pages/picture_page.dart';
import 'package:planetsort/utils/constant.dart';
import 'package:planetsort/utils/camera.dart';
import 'package:planetsort/view_model/camera_view_model.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndexMainView = 0;
  int selectedIndexBefore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: _selectedView(selectedIndexMainView),
      bottomNavigationBar: PlanetSortCustomNavBar(
          currentIndex: selectedIndexMainView,
          selectNavBarItem: (index) async {
            await takePhoto(index);
            setState((){
              selectedIndexBefore = selectedIndexMainView;
              selectedIndexMainView = index;
            });
          }
        ),
    );
  }

  Future<void> takePhoto(int index) async {
    if (selectedIndexMainView == 2 && index ==2 && selectedIndexBefore != 2) {
      final Camera_View_Model viewModel = locator.get();
      await viewModel.takePhoto();
    }
  }
  
  Widget _selectedView(int currentIndex) {
    switch(currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const MarketplacePage();
      case 2: 
        if(selectedIndexBefore != 2) {
          return CameraPage(camera: Camera.getCurrentCamera());
        } else {
          return const PicturePage();
        }
      case 3:
        return const EditProfilePage();
      case 4:
        return const MapPage();
      default : return const HomePage();
    }
  }
}