import 'package:geolocator/geolocator.dart';

class MapAppSingleton {
  late Position currentPosition;
  late Future<void> _initializeControllerFuture;

  Position getCurrentPosition() {
    return currentPosition;
  }

  Future<void> setCurrentPosition() async {
    currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  double getLatitude(){
    return currentPosition.latitude;
  }

  double getLongitude(){
    return currentPosition.longitude;
  }

  Future<void> getInitializeControllerFuture() {
    return _initializeControllerFuture;
  }

  void setInitializeControllerFuture(Future<void> initilizer) {
    _initializeControllerFuture = initilizer;
  }
}