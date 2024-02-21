import 'package:flutter/material.dart';

import 'package:planetsort/models/user.dart';
import 'package:planetsort/repository/user_service.dart';

class UserViewModel extends ChangeNotifier {
  final UserService _userService = UserService();

  Stream<List<User>> getUsersStream() {
    return _userService.getUsersStream();
  }

  Future<void> addUser(User user) async {
    await _userService.addUser(user);
    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    await _userService.updateUser(user);
    notifyListeners();
  }

  Future<void> deleteUser(String id) async {
    await _userService.deleteUser(id);
    notifyListeners();
  }
}
