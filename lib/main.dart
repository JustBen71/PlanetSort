import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'firebase_options.dart';
import 'widgets/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _base64Image;
  String _response = 'La réponse de l\'API s\'affichera ici.';

  Future<void> pickAndEncodeImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      setState(() {
        _base64Image = base64Encode(imageBytes);
      });
    }
  }

  Future<void> sendImageToChatGPTVision() async {
    const String apiKey = "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";
    const String url = "https://api.openai.com/v1/chat/completions";

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey"
    };

    if (_base64Image != null) {
      var payload = jsonEncode({
        "model": "gpt-4-1106-vision-preview",
        "messages": [
          {
            "role": "user",
            "content": [
              {
                "type": "text",
                "text":
                    "Peux-tu indiquer si l'objet présent sur l'image est recyclable. Explique brièvement."
              },
              {
                "type": "image_url",
                "image_url": {"url": "data:image/jpeg;base64,$_base64Image"}
              }
            ]
          }
        ],
        "max_tokens": 2000
      });

      var response =
          await http.post(Uri.parse(url), headers: headers, body: payload);

      if (response.statusCode == 200) {
        setState(() {
          _response = response.body;
        });
      } else {
        setState(() {
          _response = "Failed to get response: ${response.body}";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          title: const Text('PlanetSort'),
        ),
        body: Center(
          child: user != null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        pickAndEncodeImage();
                      },
                      child: const Text('Sélectionner une image'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        sendImageToChatGPTVision();
                      },
                      child: const Text('Envoyer à ChatGPT Vision'),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(_response),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                        'Veuillez vous connecter pour utiliser cette fonctionnalité.'),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage())),
                      child: const Text('Aller à la page de connexion'),
                    )
                  ],
                ),
        ));
  }
}
