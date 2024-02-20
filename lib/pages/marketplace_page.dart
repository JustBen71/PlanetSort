import 'package:flutter/material.dart';
import 'package:planetsort/component/planetsort_marketplace_item.dart';
import 'package:planetsort/component/planetsort_text_normal.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/utils/constant.dart';

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        title: const PlanetSortTitleText(
          data: "Marketplace",
          fontSize: sizetitle,
          color: beige,
        ),
        centerTitle: true,
        backgroundColor: green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Row(
                children: [
                   PlanetSortText(
                       data: "Here you will find our different partners and thier offers",
                       fontSize: paragraph,
                     )
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/41789770/r/il/f90d4d/5816837895/il_1588xN.5816837895_gdhz.jpg",
                        nomArticle: "test",
                        price: "30€",
                      ),
                    PlanetSortMarketplaceItem(
                      imagePath:
                          "https://i.etsystatic.com/38996290/r/il/c4d35f/4649971740/il_1588xN.4649971740_70ez.jpg",
                      nomArticle: "test2",
                      price: "10€",
                    ),
                        
                    
                    PlanetSortMarketplaceItem(
                      imagePath:
                          "https://i.etsystatic.com/36754141/r/il/b2aa18/5750136829/il_1588xN.5750136829_dnip.jpg",
                      nomArticle: "test3",
                      price: "45€",
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/16740231/r/il/8b76ff/2084499904/il_1588xN.2084499904_8ywa.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/16429726/r/il/c56a73/5616041924/il_1588xN.5616041924_bt70.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/40472291/r/il/83f44d/5428681650/il_1588xN.5428681650_tc8c.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/16740231/r/il/8b76ff/2084499904/il_1588xN.2084499904_8ywa.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/16429726/r/il/c56a73/5616041924/il_1588xN.5616041924_bt70.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/40472291/r/il/83f44d/5428681650/il_1588xN.5428681650_tc8c.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/16740231/r/il/8b76ff/2084499904/il_1588xN.2084499904_8ywa.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/16429726/r/il/c56a73/5616041924/il_1588xN.5616041924_bt70.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/40472291/r/il/83f44d/5428681650/il_1588xN.5428681650_tc8c.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/16740231/r/il/8b76ff/2084499904/il_1588xN.2084499904_8ywa.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/16429726/r/il/c56a73/5616041924/il_1588xN.5616041924_bt70.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                    PlanetSortMarketplaceItem(
                        imagePath:
                            "https://i.etsystatic.com/40472291/r/il/83f44d/5428681650/il_1588xN.5428681650_tc8c.jpg",
                            nomArticle: "test2",
                      price: "10€",),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 45.0)),
          ])
          ],
        )
              ,)
    );
  }
}