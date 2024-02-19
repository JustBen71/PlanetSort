import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:planetsort/component/PlanetSortButton.dart';
import 'package:planetsort/component/PlanetSortDateField.dart';
import 'package:planetsort/component/PlanetSortTextField.dart';
import 'package:planetsort/component/planetsort_text.dart';

import 'package:planetsort/pages/home_page.dart';
import 'package:planetsort/utils/constant.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _trySignUp() async {
    if (!_formKey.currentState!.validate()) return;
    if (_passwordController.text != _confirmPasswordController.text) {
      print('Passwords do not match');
      return;
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      if (!mounted) return;

      if (userCredential.user != null) {
        User newUser = userCredential.user!;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(newUser.uid)
            .set({
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'birthDate': _birthDateController.text,
          'email': _emailController.text,
        });

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      print(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PlanetSortText(
          data: "Sign up",
          fontSize: sizetitle,
        ),
        backgroundColor: green,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: green,
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20),
              PlanetSortTextField(
                controller: _firstNameController,
                icon: Icons.person,
                obscureText: false,
                placeholder: "Firstname",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              PlanetSortTextField(
                controller: _lastNameController,
                icon: Icons.person,
                obscureText: false,
                placeholder: "Lastname",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              PlanetSortDateField(
                controller: _birthDateController,
                icon: Icons.calendar_today,
                placeholder: 'Birth date',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your birth date';
                  }
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              PlanetSortTextField(
                controller: _emailController,
                icon: Icons.email,
                obscureText: false,
                placeholder: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              PlanetSortTextField(
                controller: _passwordController,
                icon: Icons.lock,
                placeholder: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              PlanetSortTextField(
                controller: _confirmPasswordController,
                icon: Icons.lock,
                placeholder: 'Confirm password',
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              PlanetSortButton(
                label: "Sign up", 
                onPressed: _trySignUp,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}