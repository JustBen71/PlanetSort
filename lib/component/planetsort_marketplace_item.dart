import 'package:flutter/material.dart';
import 'package:planetsort/component/planetsort_text_normal.dart';
import 'package:planetsort/utils/constant.dart';

class PlanetSortMarketplaceItem extends StatelessWidget {
  const PlanetSortMarketplaceItem({super.key, required this.imagePath, required this.nomArticle, required this.price});
  final String imagePath;
  final String nomArticle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imagePath, height: 100, width: 100,),
          /*PlanetSortText(data: nomArticle, fontSize: paragraph,),
          PlanetSortText(data: price, fontSize: paragraph,)*/
        ],)
    );
  }
}