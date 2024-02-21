import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'package:planetsort/models/user.dart';

class UserService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) async {
    try {
      String id = const Uuid().v4();
      await _usersCollection.doc(id).set(user.toMap());
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  Stream<List<User>> getUsersStream() {
    return _usersCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => User.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> updateUser(User user) async {
    try {
      await _usersCollection.doc(user.id).update(user.toMap());
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await _usersCollection.doc(id).delete();
    } catch (e) {
      print("Error deleting user: $e");
    }
  }
}
