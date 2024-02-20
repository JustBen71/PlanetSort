import 'package:flutter/material.dart';

import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/camera_app_singleton.dart';

class Camera_View_Model extends ChangeNotifier {
  Camera_App_Singleton appState = locator.get();
  String randomData = '';
  void getRandomImage() async {
    appState.updateDataCount();

    //notifyListeners();
  }
}
