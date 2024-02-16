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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String birthDate = _birthDateController.text;
    String currentPassword = _oldPasswordController.text;

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && currentPassword.isNotEmpty) {
      AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!, password: currentPassword);

      user.reauthenticateWithCredential(credential).then((result) {
        FirebaseFirestore.instance.collection('users').doc(user.uid).update({
          'firstName': firstName,
          'lastName': lastName,
          'birthDate': birthDate,
        }).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile updated succesfully!')),
          );
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update profile')),
          );
        });
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to reauthenticate')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Current password is required')),
      );
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleText(data: 'Edit Profile'),
        backgroundColor: green,
      ),
      body: Padding(
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
