import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'package:planetsort/locator.dart';
import 'package:planetsort/pages/login_page.dart';
import 'package:planetsort/pages/main_page.dart';
import 'package:planetsort/utils/camera.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Camera.initializeCamera();
  initLocator();
  User? user = FirebaseAuth.instance.currentUser;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp(user: user));
}

class MyApp extends StatelessWidget {
  final User? user;

  const MyApp({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: user != null ? const MainView() : const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/main': (context) => const MainView(),
        // Ajoutez ici d'autres routes nécessitant une authentification
      },
      onGenerateRoute: (settings) {
        // Protection de toutes les autres routes nécessitant une authentification
        return MaterialPageRoute(
          builder: (context) {
            if (user != null) {
              return const MainView();
            } else {
              return const LoginPage();
            }
          },
        );
      },
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: const Center(
        child: Text('Register Page'),
      ),
    );
  }
}
