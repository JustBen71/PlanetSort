import 'package:flutter/material.dart';
import 'package:planetsort/utils/constant.dart';

class PlanetSortButton extends StatefulWidget {
  const PlanetSortButton({super.key, this.onPressed, required this.label});
  final VoidCallback? onPressed;
  final String label;


  @override
  State<PlanetSortButton> createState() => _PlanetSortButtonState();
}

class _PlanetSortButtonState extends State<PlanetSortButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: beige,
        foregroundColor: green,
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: Text(widget.label),
    );
  }
}