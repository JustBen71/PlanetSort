import 'package:flutter/material.dart';

import 'package:planetsort/pages/camera_page.dart';
import 'package:planetsort/pages/home_page.dart';
import 'package:planetsort/pages/picture_page.dart';
import 'package:planetsort/utils/camera.dart';

Route<dynamic> generateRoute(String name) {
  switch (name) {
    case cameraPage:
      return MaterialPageRoute(
        builder: (context) => CameraPage(
          // Pass the appropriate camera to the CameraPage widget.
          camera: Camera.getCurrentCamera(),
        ),
      );
    case picturePage:
      return MaterialPageRoute(
        builder: (context) => const PicturePage(
            // Pass the automatically generated path to
            // the PicturePage widget.
            ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  }
}

const String cameraPage = 'Camera';
const String homePage = 'Home';
const String picturePage = 'Picture';
