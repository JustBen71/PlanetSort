import 'package:flutter/material.dart';

import 'package:planetsort/utils/constant.dart';

class PlanetSortText extends StatelessWidget {
  final String data;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;

  const PlanetSortText({
    super.key,
    required this.data,
    this.color = beige,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'RockNRoll',
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Text(
          overflow: TextOverflow.visible,
          data,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
          ),
          softWrap: true,
        ),
      ],)
      
    );
  }
}
