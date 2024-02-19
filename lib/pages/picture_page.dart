// A widget that displays the picture taken by the user.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/camera_app_singleton.dart';

class PicturePage extends StatelessWidget {

  const PicturePage({super.key});

  String getPicturePath() {
    Camera_App_Singleton appState = locator.get();
    return appState.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = getPicturePath();
    savePicture(imagePath);
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }

  void savePicture(String imagePath) async {
    // Saving the image
  
    // Deleting old file
    //await File(imagePath).delete();
  }
}