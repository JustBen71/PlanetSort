import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';

import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/camera_app_singleton.dart';
import 'package:planetsort/utils/constant.dart';
import 'package:planetsort/utils/openai.dart';

class PicturePage extends StatefulWidget {
  const PicturePage({super.key});

  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  final OpenAiClient _openAiClient = OpenAiClient();
  late Future<Position?> _getCurrentLocation;

  Uint8List getImageBytes(String imagePath) {
    Uint8List bytes = base64Decode(imagePath);
    return bytes;
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation = _getCurrentPosition();
  }

  Future<Position?> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = getPicturePath();
    Uint8List imageBytes = getImageBytes(imagePath);

    return Scaffold(
      backgroundColor: green,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
            child: Image.memory(
              imageBytes,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getCurrentLocation,
              builder: (context, AsyncSnapshot<Position?> positionSnapshot) {
                if (positionSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (positionSnapshot.hasError) {
                  return Center(
                    child: Text('Error: ${positionSnapshot.error}'),
                  );
                } else {
                  Position position = positionSnapshot.data!;
                  return FutureBuilder(
                    future: _openAiClient.requestOpenAI(
                      prompt: """You are a recycling expert.
Can you tell me if the object in the photo is recyclable in around twenty words depending on my location?
I am currently located here: ${position.latitude} ${position.longitude}.
Give me an ecological information about the object.
Can you also give me an explanation of the recycling cycle of this object in around twenty words?
Do not add a conclusion.
Respond only in this JSON format and nothing more: {"object_name": string, "material": string, "ecological_info": string, "recyclable": boolean, "recycling_cycle": string}.
If the image is not visible, respond in this JSON format: {"object_name": "Not visible", "material": "None", "ecological_info": "None", "recyclable": false, "recycling_cycle": "None"}""",
                      base64Image: base64Encode(imageBytes),
                      latitude: position.latitude,
                      longitude: position.longitude,
                    ),
                    builder: (context,
                        AsyncSnapshot<Map<String, dynamic>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData || snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        var apiResponse = snapshot.data!;
                        var choices = apiResponse['choices'] as List<dynamic>;
                        var firstChoice = choices.first;
                        String messageContent =
                            firstChoice['message']['content'];
                        var cleanedMessageContent = messageContent
                            .replaceAll('```json', '')
                            .replaceAll('```', '');

                        var decodedMessage = jsonDecode(cleanedMessageContent);

                        String objectName =
                            decodedMessage['object_name'] ?? 'Unknown';
                        String material =
                            decodedMessage['material'] ?? 'Unknown';
                        bool recyclable = decodedMessage['recyclable'] ?? false;
                        String recyclingCycle =
                            decodedMessage['recycling_cycle'] ??
                                'Unknown recycling cycle';
                        String ecoInfo = decodedMessage['ecological_info'] ??
                            'Unknown ecological information';
                        return ListView(
                          padding: const EdgeInsets.all(16.0),
                          children: [
                            Center(
                              child: Text(
                                recyclable
                                    ? 'Yes, it\'s recyclable 😎'
                                    : 'Not recyclable 😔',
                                style: const TextStyle(
                                    fontSize: sizetitle2,
                                    fontFamily: 'RockNRoll',
                                    color: beige),
                              ),
                            ),
                            Text(
                              capitalizeFirstLetter(objectName),
                              style: const TextStyle(
                                fontSize: sizetitle2,
                                fontFamily: 'RockNRoll',
                                color: beige,
                              ),
                            ),
                            Text(
                              ecoInfo,
                              style: const TextStyle(
                                fontSize: paragraph,
                                fontFamily: 'RockNRoll',
                                color: beige,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Text('Material',
                                style: TextStyle(
                                    fontSize: sizetitle2,
                                    fontFamily: 'RockNRoll',
                                    color: beige)),
                            Text(
                              capitalizeFirstLetter(material),
                              style: const TextStyle(
                                fontSize: paragraph,
                                fontFamily: 'RockNRoll',
                                color: beige,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Text('Recycling cycle',
                                style: TextStyle(
                                    fontSize: sizetitle2,
                                    fontFamily: 'RockNRoll',
                                    color: beige)),
                            Text(
                              recyclingCycle,
                              style: const TextStyle(
                                  fontSize: paragraph,
                                  fontFamily: 'RockNRoll',
                                  color: beige),
                            ),
                            const Padding(padding: EdgeInsets.all(8.0)),
                          ],
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  String getPicturePath() {
    Camera_App_Singleton appState = locator.get();
    return appState.imageBase64;
  }
}
