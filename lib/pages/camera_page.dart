import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/camera_app_singleton.dart';
import 'package:planetsort/utils/constant.dart';
import 'package:planetsort/view_model/camera_view_model.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  Camera_App_Singleton appState = locator.get();
  final Camera_View_Model viewModel = locator.get();

  @override
  void initState() {
    super.initState();
    viewModel.initCamera(widget.camera);
  }

  @override
  void dispose() {
    viewModel.disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: viewModel.getInitializeControllerFuture(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Column(
              children: <Widget>[
                Expanded(
                  child: CameraPreview(viewModel.getController())
                ),
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}