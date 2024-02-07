import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';

  void _trySignUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    _formKey.currentState!.save();
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      if (newUser.user != null) {}
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inscription')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              onSaved: (value) => _email = value!,
              validator: (value) => value!.isEmpty ? 'Entrez un email' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
              onSaved: (value) => _password = value!,
              validator: (value) =>
                  value!.length < 6 ? 'Mot de passe trop court' : null,
            ),
            ElevatedButton(
              onPressed: _trySignUp,
              child: const Text('S\'inscrire'),
            ),
          ],
        ),
      ),
    );
  }
}
