import 'package:flutter/material.dart';

import 'package:planetsort/utils/constant.dart';

class PlanetSortText extends StatelessWidget {
  final String data;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextAlign textAlign;

  const PlanetSortText({
    super.key,
    required this.data,
    this.color = beige,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'RockNRoll',
    this.textAlign = TextAlign.left,
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
          textAlign: textAlign,
          softWrap: true,
        ),
      ],)
      
    );
  }
}
