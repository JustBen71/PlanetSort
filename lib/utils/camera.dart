import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera {
  static late CameraDescription currentCamera;

  static CameraDescription getCurrentCamera() {
    return currentCamera;
  }

  static Future<void> initializeCamera() async {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    currentCamera = cameras.first;
  }
}
