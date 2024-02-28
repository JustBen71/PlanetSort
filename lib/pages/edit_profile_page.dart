import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:planetsort/component/planetsort_button.dart';
import 'package:planetsort/component/planetsort_datefield.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/component/planetsort_textfield.dart';
import 'package:planetsort/routes/router.dart';
import 'package:planetsort/utils/constant.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _controllers = List.generate(6, (_) => TextEditingController());
  late final TextEditingController _firstNameController = _controllers[0];
  late final TextEditingController _lastNameController = _controllers[1];
  late final TextEditingController _birthDateController = _controllers[2];
  late final TextEditingController _oldPasswordController = _controllers[3];
  late final TextEditingController _newPasswordController = _controllers[4];
  late final TextEditingController _confirmPasswordController = _controllers[5];
  bool disabled = true;
  String labelEdit = "Edit";

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
      if (mounted) {
        setState(() {
          _firstNameController.text = userData['firstName'];
          _lastNameController.text = userData['lastName'];
          _birthDateController.text = userData['birthDate'];
        });
      }
    }
  }

  Future<void> _updateUserProfile() async {
    if (!mounted) return;

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

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(generateRoute("Sign_in"), (Route<dynamic> route) => false);
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _disableField()
  {
    setState(() {
      disabled = false;
      labelEdit = "Confirm";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PlanetSortTitleText(
            data: 'Edit Profile', fontSize: sizetitle),
        centerTitle: true,
        backgroundColor: green,
      ),
      backgroundColor: green,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: PlanetSortTextField(
                  controller: _firstNameController,
                  icon: Icons.person,
                  placeholder: 'First Name',
                  obscureText: false,
                  disabled: disabled,
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: PlanetSortTextField(
                    controller: _lastNameController,
                    icon: Icons.person,
                    obscureText: false,
                    disabled: disabled,
                    placeholder: 'Last Name')),
            Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: PlanetSortDateField(
                    controller: _birthDateController,
                    icon: Icons.calendar_today,
                    disabled: disabled,
                    placeholder: 'Birth Date')),
            Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: PlanetSortTextField(
                    controller: _oldPasswordController,
                    icon: Icons.lock,
                    obscureText: true,
                    disabled: disabled,
                    placeholder: 'Enter actual password')),
            Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: PlanetSortTextField(
                  controller: _newPasswordController,
                  obscureText: true,
                  icon: Icons.lock,
                  disabled: disabled,
                  placeholder: 'Enter new password',
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: PlanetSortTextField(
                    controller: _confirmPasswordController,
                    icon: Icons.lock,
                    obscureText: true,
                    disabled: disabled,
                    placeholder: 'Confirm your new password')),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: PlanetSortButton(
                onPressed: disabled ? _disableField : _updateUserProfile,
                label: labelEdit,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: PlanetSortButton(
                onPressed: _logout,
                label: 'Sign Out',
              ),
            )
            ,
            PlanetSortButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(generateRoute("PrivacyStatement"));
              },
              label: 'Privacy Statement',
            ),
          ],
        ),
      ),
    );
  }
}
