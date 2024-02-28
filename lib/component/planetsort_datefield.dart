import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:planetsort/utils/constant.dart';

class PlanetSortDateField extends StatefulWidget {
  const PlanetSortDateField({
    super.key,
    required this.controller,
    required this.icon,
    required this.placeholder,
    this.validator,
    this.disabled = false,
  });

  final TextEditingController controller;
  final IconData icon;
  final String placeholder;
  final String? Function(String?)? validator;
  final bool disabled;

  @override
  State<PlanetSortDateField> createState() => _PlanetSortDateFieldState();
}

class _PlanetSortDateFieldState extends State<PlanetSortDateField> {
  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.controller.text.isNotEmpty
          ? DateFormat('yyyy-MM-dd').parse(widget.controller.text)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        widget.controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: widget.disabled ? TextStyle(
        foreground: Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
      ) : const TextStyle(),
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
      readOnly: true,
      validator: widget.validator,
      onTap: widget.disabled ? () {
        
      } : _pickDate,
    );
  }
}
