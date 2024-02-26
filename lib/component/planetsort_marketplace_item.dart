import 'package:flutter/material.dart';

import 'package:planetsort/utils/constant.dart';

import 'package:url_launcher/url_launcher_string.dart';
class PlanetSortMarketplaceItem extends StatelessWidget {
  const PlanetSortMarketplaceItem(
      {super.key,
      required this.imagePath,
      required this.nomArticle,
      required this.price,
      required this.url});
  final String imagePath;
  final String nomArticle;
  final String price;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
        TextButton(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.network(
                          imagePath,
                          height: 100,
                          width: 100,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child:
                      Text(nomArticle,
                        style: const TextStyle(
                            fontFamily: 'RockNRoll',
                            color: beige,
                            fontSize: 11,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(price,
                    style: const TextStyle(
                        fontFamily: 'RockNRoll',
                        color: beige,
                        fontSize: 11),
                    textAlign: TextAlign.center)
                ],
              ),
            ],
          ),
          onPressed: () {
            launchUrlString(url);
          }
        )
    );
  }
}