import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/component/planetsort_text_normal.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/camera_app_singleton.dart';
import 'package:planetsort/utils/constant.dart';

class PicturePage extends StatelessWidget {

  const PicturePage({super.key});

  String getPicturePath() {
    Camera_App_Singleton appState = locator.get();
    return appState.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = getPicturePath();
    // Saving the image to the database 
    savePicture(imagePath);

    return Scaffold(
      backgroundColor: green,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.file(File(imagePath)),
          ),
      
          const SizedBox(height: 16.0),
      
          const ListTile(
            title: Center(
              child: PlanetSortTitleText(
                data: 'Plastic bottle',
                //color: green,
                fontSize: sizetitle3,
              ),
            ),
            subtitle: PlanetSortText(
              data:
                  'Several international NGOs have revealed that disposable bottles are the most common plastic waste found in European white waters. These bottles represent on average 14% of water pollution on the old continent',
              //color: green,
              fontSize: paragraph,
            ),
          ),
        ],
      )
    );
  }

  void savePicture(String imagePath) async {
    // Saving the image
  
    // Deleting old file
    //await File(imagePath).delete();
  }
}