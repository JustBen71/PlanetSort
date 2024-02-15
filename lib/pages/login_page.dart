import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:planetsort/component/PlanetSortButton.dart';
import 'package:planetsort/component/PlanetSortTextField.dart';
import 'package:planetsort/component/TitleText.dart';

import 'package:planetsort/pages/home_page.dart';
import 'package:planetsort/pages/signup_page.dart';
import 'package:planetsort/utils/constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _tryLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (userCredential.user != null && mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to sign in: ${e.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: green,
        title: const TitleText(
          data: 'Sign in',
        ),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                PlanetSortTextField(
                  controller: _emailController,
                  icon: Icons.person,
                  obscureText: false,
                  placeholder: "Email",
                  onSaved: (value) => _emailController.text = value!.toString(),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                PlanetSortTextField(
                  controller: _passwordController,
                  icon: Icons.lock,
                  placeholder: 'Mot de passe',
                  obscureText: true,
                  onSaved: (value) =>
                      _passwordController.text = value!.toString(),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                PlanetSortButton(
                  label: 'Sign in',
                  onPressed: _tryLogin,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                PlanetSortButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  label: 'Créer un compte',
                ),
              ],
            ),
          )),
    );
  }
}
