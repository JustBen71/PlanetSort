import 'package:flutter/material.dart';
import 'package:planetsort/utils/constant.dart';

class PlanetSortTitleText extends StatelessWidget {
  final String data;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;

  const PlanetSortTitleText({
    super.key,
    required this.data,
    this.color = beige,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'RockNRoll',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: fontSize < 30 ? MediaQuery.of(context).size.height * 0.05 : MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width *0.8,
        child: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.scaleDown,
          child: Text(
            overflow: TextOverflow.visible,
            data,
            //textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
            ),
            softWrap: true,
          ),
        ),
    );
  }
}
