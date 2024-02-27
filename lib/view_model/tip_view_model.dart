import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/models/tip.dart';
import 'package:planetsort/repository/tip_app_singleton.dart';

class TipViewModel extends ChangeNotifier {
  TipSingleton appState = locator.get();

  Future<void> readJson() async {
    if(appState.currentTip.tip == "") {
      // Generating a random number between 0 and 99
      int nb = Random().nextInt(100);
      
      // Retrieving the Json file
      String jsonString = await rootBundle.loadString('assets/tips.json');
      // Conversion to list
      List<dynamic> jsonDataList = jsonDecode(jsonString);
      // Retrieving the current tip
      Map<String, dynamic> element = jsonDataList[nb];
      // Conversion to object
      Tip tip = Tip.fromJson(element);

      appState.currentTip = tip;
    }
  }
}
