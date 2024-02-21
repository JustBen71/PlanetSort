import 'package:flutter/material.dart';

import 'package:planetsort/models/waste.dart';
import 'package:planetsort/services/waste_service.dart';

class WasteViewModel extends ChangeNotifier {
  final WasteService _wasteService = WasteService();

  Stream<List<Waste>> getWastesStream() {
    return _wasteService.getWastesStream();
  }

  Future<void> addWaste(Waste waste) async {
    await _wasteService.addWaste(waste);
    notifyListeners();
  }

  Future<void> updateWaste(Waste waste) async {
    await _wasteService.updateWaste(waste);
    notifyListeners();
  }

  Future<void> deleteWaste(String id) async {
    await _wasteService.deleteWaste(id);
    notifyListeners();
  }
}
