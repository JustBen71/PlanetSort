import 'package:camera/camera.dart';

class Camera_App_Singleton {
  String imagePath = "";
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  void setImagePath(String newPath) {
    imagePath = newPath;
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
