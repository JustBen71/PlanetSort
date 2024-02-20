import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/camera_app_singleton.dart';

class PicturePage extends StatelessWidget {
  const PicturePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final imagePath = getPicturePath();
    print('Image Path: $imagePath');
    if (imagePath.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Display the Picture')),
        body: Image.file(File(imagePath)),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Display the Picture')),
        body: const Center(child: Text('Image path is empty')),
      );
    }
  }

  String getPicturePath() {
    final appState = locator.get<Camera_App_Singleton>();
    final imagePath = appState.imagePath;
    print('Stored image path: ${appState.imagePath}');
    return imagePath;
  }

  void savePicture(String imagePath) async {
    // Saving the image

    // Deleting old file
    //await File(imagePath).delete();
  }
}
