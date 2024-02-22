import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/map_app_singleton.dart';

class MapViewModel extends ChangeNotifier {
  final MapAppSingleton appState = locator.get<MapAppSingleton>();

  Position getCurrentPosition(){
    return appState.getCurrentPosition();
  }

  Future<void> setCurrentPosition() async {
    return await appState.setCurrentPosition();
  }

  double getLatitude(){
    return appState.getLatitude();
  }

  double getLongitude(){
    return appState.getLongitude();
  }
}