import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/pages/home_page.dart';
import 'package:planetsort/utils/camera.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Camera.initializeCamera();
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
