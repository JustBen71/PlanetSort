import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planetsort/utils/constant.dart';

class DailyTipWidget extends StatefulWidget {
  const DailyTipWidget({Key? key}) : super(key: key);

  @override
  _DailyTipWidgetState createState() => _DailyTipWidgetState();
}

class _DailyTipWidgetState extends State<DailyTipWidget> {
  bool _isVisible = true; // Initialisé à true pour que le widget soit visible au départ

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible; // Bascule la visibilité
    });
  }

  @override
  Widget build(BuildContext context) {
    // Retourne un Container vide si _isVisible est false
    if (!_isVisible) 
    {
      return GestureDetector(
        onTap: () {
          setState(() {
            _isVisible = true;
          });
        },
        child: const Card(
        color: beige,
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    'Daily Tips  ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "RockNRoll",
                      color: green,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Icon(
                    Icons.arrow_circle_down,
                    color: green,
                  ),
                ]
              )
            ]
          ),
        )
      )
            );
  }

    return Card(
      /*shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(80),
        topRight: Radius.circular(80),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20))
      ),*/
      color: beige,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isVisible = false;
          });
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Daily Tips  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: green,
                    fontFamily: "RockNRoll",
                  ),
                ),
                Icon(
                   Icons.arrow_circle_up, 
                   color: green,
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            Text(
              'Use public transportation or prefer environmentally friendly means of transportation.',
              style: TextStyle(color: green, fontFamily: "RockNRoll", ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      ),
    );
  }
}