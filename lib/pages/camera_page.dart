import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:planetsort/locator.dart';
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
      body: FutureBuilder<void>(
        future: viewModel.getInitializeControllerFuture(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(viewModel.getController());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
