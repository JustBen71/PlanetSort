import 'package:flutter/material.dart';
import 'package:planetsort/utils/constant.dart';

class PlanetSortTextField extends StatefulWidget {
  const PlanetSortTextField({super.key, required this.controller, required this.icon, this.validator, required this.obscureText, required this.placeholder, this.onSaved});
  final TextEditingController controller;
  final String placeholder;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;

  @override
  State<PlanetSortTextField> createState() => _PlanetSortTextFieldState();
}

class _PlanetSortTextFieldState extends State<PlanetSortTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
        obscureText: widget.obscureText,
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: green),
          hintText: widget.placeholder,
          filled: true,
          fillColor: beige,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      onSaved: widget.onSaved ,
    );
  }
}