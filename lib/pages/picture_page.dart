// A widget that displays the picture taken by the user.
import 'dart:io';

import 'package:flutter/material.dart';

class PicturePage extends StatelessWidget {
  final String imagePath;

  const PicturePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
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
