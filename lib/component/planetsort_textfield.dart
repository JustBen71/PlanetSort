import 'package:flutter/material.dart';

import 'package:planetsort/utils/constant.dart';

class PlanetSortTextField extends StatelessWidget {
  const PlanetSortTextField(
      {super.key,
      required this.controller,
      required this.icon,
      this.validator,
      required this.obscureText,
      required this.placeholder,
      this.onSaved});

  final TextEditingController controller;
  final String placeholder;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: green),
        hintText: placeholder,
        filled: true,
        fillColor: beige,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      onSaved: onSaved,
    );
  }
}
