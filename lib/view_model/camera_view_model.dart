import 'package:flutter/material.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/camera_app_singleton.dart';
import 'package:camera/camera.dart';

class Camera_View_Model extends ChangeNotifier {
  final Camera_App_Singleton appState = locator.get<Camera_App_Singleton>();
  //String randomData = '';

  CameraController getController() {
    return appState.getController();
  }

  Future<void> getInitializeControllerFuture() {
    return appState.getInitializeControllerFuture();
  }

  void initCamera(CameraDescription camera) {
    // To display the current output from the Camera,
    // create a CameraController.
    appState.setController(CameraController(
      // Get a specific camera from the list of available cameras.
      camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    ));

    // Next, initialize the controller. This returns a Future.
    appState.setInitializeControllerFuture(getController().initialize());
  }

  void disposeCamera() {
    // Dispose of the controller when the widget is disposed.
    getController().dispose();
  }

  void setImagePath(String imagePath) {
    appState.setImagePath(imagePath);
  }

  Future<void> takePhoto() async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Ensure that the camera is initialized.
      await getInitializeControllerFuture();
      // No flash
      await getController().setFlashMode(FlashMode.off);

      // Attempt to take a picture and get the file `image`
      // where it was saved.
      final image = await getController().takePicture();

      print('Image: $image');
      //if (!mounted) return;
      appState.setImagePath(image.path);
      notifyListeners();

      //viewModel.setImagePath(image.path);
      // If the picture was taken, display it on a new screen.
      /*await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PicturePage(
            // Pass the automatically generated path to
            // the PicturePage widget.
            imagePath: image.path,
          ),
        ),
      );*/
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }
}
