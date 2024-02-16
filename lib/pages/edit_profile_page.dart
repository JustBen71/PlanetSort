import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planetsort/component/PlanetSortButton.dart';
import 'package:planetsort/component/PlanetSortDateField.dart';
import 'package:planetsort/component/PlanetSortTextField.dart';
import 'package:planetsort/component/TitleText.dart';

import 'package:planetsort/utils/constant.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _controllers = List.generate(7, (_) => TextEditingController());
  late final TextEditingController _firstNameController = _controllers[0];
  late final TextEditingController _lastNameController = _controllers[1];
  late final TextEditingController _emailController = _controllers[2];
  late final TextEditingController _birthDateController = _controllers[3];
  late final TextEditingController _oldPasswordController = _controllers[4];
  late final TextEditingController _newPasswordController = _controllers[5];
  late final TextEditingController _confirmPasswordController = _controllers[6];

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _firstNameController.text = userData['firstName'];
        _lastNameController.text = userData['lastName'];
        _emailController.text = userData['email'];
        _birthDateController.text = userData['birthDate'];
      });
    }
  }

  Future<void> _updateUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No user is currently signed in')),
      );
      return;
    }

    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    Map<String, dynamic> updates = {};

    if (_firstNameController.text != userData['firstName']) {
      updates['firstName'] = _firstNameController.text;
    }

    if (_lastNameController.text != userData['lastName']) {
      updates['lastName'] = _lastNameController.text;
    }

    if (_birthDateController.text != userData['birthDate']) {
      updates['birthDate'] = _birthDateController.text;
    }

    if (_oldPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Current password is required')),
      );
      return;
    }

    AuthCredential credential = EmailAuthProvider.credential(
      email: user.email!,
      password: _oldPasswordController.text,
    );

    try {
      await user.reauthenticateWithCredential(credential);

      if (_newPasswordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty) {
        if (_newPasswordController.text != _confirmPasswordController.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('New passwords don\'t match')),
          );
          return;
        }

        await user.updatePassword(_newPasswordController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password updated successfully')),
        );
      }

      if (updates.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update(updates);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The current password is incorrect')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update profile')),
        );
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleText(data: 'Edit Profile'),
        backgroundColor: green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PlanetSortTextField(
              controller: _firstNameController,
              icon: Icons.person,
              placeholder: 'First Name',
              obscureText: false,
            ),
            PlanetSortTextField(
                controller: _lastNameController,
                icon: Icons.person,
                obscureText: false,
                placeholder: 'Last Name'),
            PlanetSortDateField(
                controller: _birthDateController,
                icon: Icons.calendar_today,
                placeholder: 'Birth Date'),
            PlanetSortTextField(
                controller: _oldPasswordController,
                icon: Icons.lock,
                obscureText: true,
                placeholder: 'Enter actual password'),
            PlanetSortTextField(
              controller: _newPasswordController,
              obscureText: true,
              icon: Icons.lock,
              placeholder: 'Enter new password',
            ),
            PlanetSortTextField(
                controller: _confirmPasswordController,
                icon: Icons.lock,
                obscureText: true,
                placeholder: 'Confirm your new password'),
            const SizedBox(height: 20),
            PlanetSortButton(
              onPressed: _updateUserProfile,
              label: 'Edit',
            ),
          ],
        ),
      ),
    );
  }
}
