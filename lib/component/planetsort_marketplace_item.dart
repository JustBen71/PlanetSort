import 'package:flutter/material.dart';

import 'package:planetsort/utils/constant.dart';

class PlanetSortMarketplaceItem extends StatelessWidget {
  const PlanetSortMarketplaceItem(
      {super.key,
      required this.imagePath,
      required this.nomArticle,
      required this.price});
  final String imagePath;
  final String nomArticle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: green,
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  imagePath,
                  height: 100,
                  width: 100,
                )
              ],
            ),
            Row(
              children: [
                Text(nomArticle,
                    style: const TextStyle(
                        backgroundColor: green,
                        fontFamily: 'RockNRoll',
                        color: beige,
                        fontSize: 11))
              ],
            ),
            Row(
              children: [
                Text(price,
                    style: const TextStyle(
                        backgroundColor: green,
                        fontFamily: 'RockNRoll',
                        color: beige,
                        fontSize: 11))
              ],
            ),
          ],
        ));
  }
}
