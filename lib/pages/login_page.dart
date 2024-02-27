import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:planetsort/component/planetsort_button.dart';
import 'package:planetsort/component/planetsort_textfield.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/pages/main_page.dart';
import 'package:planetsort/pages/signup_page.dart';
import 'package:planetsort/utils/constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.firebase});
  final FirebaseAuth firebase;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late FirebaseAuth _auth;
  

  @override
  void initState()
  {
    _auth = widget.firebase;
  }

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
            MaterialPageRoute(builder: (context) => const MainView()),
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
        title: const PlanetSortTitleText(
          data: 'Sign in',
          fontSize: sizetitle,
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
                  key: const Key('email'),
                  controller: _emailController,
                  icon: Icons.person,
                  obscureText: false,
                  placeholder: 'Email',
                  onSaved: (value) => _emailController.text = value!.toString(),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                PlanetSortTextField(
                  key: const Key('passwordField'),
                  controller: _passwordController,
                  icon: Icons.lock,
                  placeholder: 'Password',
                  obscureText: true,
                  onSaved: (value) =>
                      _passwordController.text = value!.toString(),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                PlanetSortButton(
                  key: const Key("loginButton"),
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
                  label: 'Create an account',
                ),
              ],
            ),
          )),
    );
  }
}
