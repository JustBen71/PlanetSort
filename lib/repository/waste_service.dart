import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'package:planetsort/models/waste.dart';

class WasteService {
  final CollectionReference _wastesCollection =
      FirebaseFirestore.instance.collection('wastes');

  Future<void> addWaste(Waste waste) async {
    try {
      String id = const Uuid().v4();
      await _wastesCollection.doc(id).set(waste.toMap());
    } catch (e) {
      print("Error adding waste: $e");
    }
  }

  Stream<List<Waste>> getWastesStream() {
    return _wastesCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Waste.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> updateWaste(Waste waste) async {
    try {
      await _wastesCollection.doc(waste.id).update(waste.toMap());
    } catch (e) {
      print("Error updating waste: $e");
    }
  }

  Future<void> deleteWaste(String id) async {
    try {
      await _wastesCollection.doc(id).delete();
    } catch (e) {
      print("Error deleting waste: $e");
    }
  }
}
