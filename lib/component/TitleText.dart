import 'package:flutter/material.dart';
import 'package:planetsort/utils/constant.dart';

class TitleText extends StatelessWidget {
  final String data;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;

  TitleText(
  {
    required this.data,
    this.color = BEIGE,
    this.fontSize = 55,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'RockNRoll',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}