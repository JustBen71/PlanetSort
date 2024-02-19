import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:planetsort/pages/login_page.dart';

import 'package:planetsort/pages/main_page.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/utils/camera.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Camera.initializeCamera();
  initLocator();
  User? user = FirebaseAuth.instance.currentUser;
  if(user != null)
  {
    runApp(const MyApp());
  }
  else
  {
    runApp(const MyAppNoSignIn());
  }
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainView(),
    );
  }
}

class MyAppNoSignIn extends StatelessWidget {
  const MyAppNoSignIn({super.key});

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