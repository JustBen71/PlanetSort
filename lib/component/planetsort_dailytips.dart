import 'package:flutter/material.dart';
import 'package:planetsort/utils/constant.dart';

class DailyTipsCard extends StatelessWidget {
  final String tip;
  //final VoidCallback onClose;

  const DailyTipsCard({
    super.key,
    required this.tip,
    //required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: beige, // Couleur de fond de la carte, ajustez selon votre hexadécimal
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Daily Tips',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: green, // Ajustez la couleur selon le besoin
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                tip,
                style: const TextStyle(
                  color: green, // Ajustez la couleur selon le besoin
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: green), // Couleur de l'icône X
              onPressed: (() => {

              }),
            ),
          ],
        ),
      ),
    );
  }
}