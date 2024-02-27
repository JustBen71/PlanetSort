import 'package:camera/camera.dart';

class Camera_App_Singleton {
  String imageBase64 = "";
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  void setBase64Image(String newBase64) {
    imageBase64 = newBase64;
  }

  CameraController getController() {
    return _controller;
  }

  Future<void> getInitializeControllerFuture() {
    return _initializeControllerFuture;
  }

  void setController(CameraController controller) {
    _controller = controller;
  }

  void setInitializeControllerFuture(Future<void> initilizer) {
    _initializeControllerFuture = initilizer;
  }
}
