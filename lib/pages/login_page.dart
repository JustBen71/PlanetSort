import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:planetsort/component/PlanetSortButton.dart';
import 'package:planetsort/component/PlanetSortTextField.dart';
import 'package:planetsort/component/planetsort_text_title.dart';

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
  final _email = TextEditingController();
  final _password = TextEditingController();

  void _tryLogin() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    _formKey.currentState!.save();
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      if (user.user != null && mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: green, 
        title: const PlanetSortTitleText(data: 'Sign in',
        fontSize: sizetitle,),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child:  Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              PlanetSortTextField(
                controller: _email, 
                icon: Icons.person, 
                obscureText: false,
                placeholder: "Email",
                onSaved: (value) => _email.text = value!.toString(),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              PlanetSortTextField(
                controller: _password,
                icon: Icons.lock,
                placeholder: 'Mot de passe',
                obscureText: true,
                onSaved: (value) => _password.text = value!.toString(),
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
        ),)
      ),
    );
  }
}
