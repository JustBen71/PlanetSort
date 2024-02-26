import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:planetsort/component/planetsort_text_normal.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/camera_app_singleton.dart';
import 'package:planetsort/utils/constant.dart';

class PicturePage extends StatelessWidget {
  const PicturePage({super.key});

  Uint8List getImageBytes(String imagePath) {
    Uint8List bytes = base64Decode(imagePath);
    return bytes;
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
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                Center(
                  child: PlanetSortTitleText(
                    data: 'Plastic bottle',
                    fontSize: sizetitle3,
                  ),
                ),
                SizedBox(height: 16.0),
                PlanetSortText(
                  data:
                      'Several international NGOs have revealed that disposable bottles are the most common plastic waste found in European white waters. These bottles represent on average 14% of water pollution on the old continent',
                  fontSize: paragraph,
                ),
                SizedBox(height: 24.0),
                PlanetSortTitleText(
                  data: 'How to sort it?',
                  fontSize: sizetitle3,
                ),
                SizedBox(height: 8.0),
                PlanetSortText(
                  data:
                      'Once the bottle is emptied, rinsed and crushed, place it in the appropriate plastic recycling bin. Make sure you put it in the correct bin to make the recycling process easier.',
                  fontSize: paragraph,
                ),
                Padding(padding: EdgeInsets.all(8.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getPicturePath() {
    Camera_App_Singleton appState = locator.get();
    return appState.imagePath;
  }
}
