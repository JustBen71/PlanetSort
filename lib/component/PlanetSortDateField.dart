import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planetsort/utils/constant.dart';

class PlanetSortDateField extends StatefulWidget {
  const PlanetSortDateField({super.key, required this.controller, required this.icon, required this.placeholder, this.validator});
  final TextEditingController controller;
  final IconData icon;
  final String placeholder;
  final String? Function(String?)? validator;


  @override
  State<PlanetSortDateField> createState() => _PlanetSortDateFieldState();
}

class _PlanetSortDateFieldState extends State<PlanetSortDateField> {
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context, DateTime? _selectedDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: GREEN),
          filled: true,
          hintText: widget.placeholder,
          fillColor: BEIGE,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        readOnly: true,
        validator: widget.validator,
        onTap: () => _pickDate(context, _selectedDate),
      );
  }
}

 