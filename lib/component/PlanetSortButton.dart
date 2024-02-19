import 'package:flutter/material.dart';

import 'package:planetsort/utils/constant.dart';

class PlanetSortButton extends StatelessWidget {
  const PlanetSortButton({super.key, this.onPressed, required this.label});
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: beige,
        foregroundColor: green,
        textStyle: const TextStyle(
          fontSize: 20,
          fontFamily: 'RockNRoll',
          ),
      ),
      child: Text(label),
    );
  }
}
