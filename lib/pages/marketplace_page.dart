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
                       data: "Here you will find our different partners and their offers.",
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
                      imagePath: "https://i.etsystatic.com/5317778/r/il/c34dde/4263377415/il_794xN.4263377415_ovba.jpg",
                      nomArticle: "Organic paper towel",
                      price: "SGD 25.98",
                      url: 'https://www.etsy.com/sg-en/listing/257390846/serviettes-de-papier-en-coton-biologique'
                    ),
                    PlanetSortMarketplaceItem(
                        imagePath: "https://i.etsystatic.com/19893040/r/il/0ddcd7/3907960016/il_794xN.3907960016_ej9x.jpg",
                        nomArticle: "Recyclable pens",
                        price: "SGD 10.84",
                        url: 'https://www.etsy.com/sg-en/listing/1238880403/ensemble-de-stylos-ecologiques-paquet-de'
                      ),
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/10728526/r/il/43216e/3337167039/il_794xN.3337167039_issh.jpg",
                      nomArticle: "Set of 2 notebooks",
                      price: "SGD 15.53",
                      url: 'https://www.etsy.com/sg-en/listing/1060391948/ensemble-de-2-carnets-carnets-oranges'
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/45655764/r/il/49d708/5521970707/il_794xN.5521970707_bpbv.jpg",
                      nomArticle: "Reusable wooden cutlery set",
                      price: "SGD 18.33",
                      url: 'https://www.etsy.com/sg-en/listing/1536424023/ensemble-de-couverts-en-bois-de-style'
                    ),
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/25827525/r/il/9baf09/5804013449/il_794xN.5804013449_3c3q.jpg",
                      nomArticle: "Natural Coconut Milk Soap",
                      price: "SGD 11.05",
                      url: 'https://www.etsy.com/sg-en/listing/1674098779/savon-naturel-au-lait-de-coco-o-savon-au'
                    ),
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/12764689/r/il/c833e9/5563653482/il_794xN.5563653482_toxu.jpg",
                      nomArticle: "Sustainable and eco-friendly kitchen kit",
                      price: "SGD 80.22",
                      url: 'https://www.etsy.com/sg-en/listing/1073907913/coffret-cadeau-kit-de-cuisine-durable'
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/27920321/r/il/347332/5114683083/il_794xN.5114683083_5tez.jpg",
                      nomArticle: "Reusable kitchen roll",
                      price: "SGD 15.53",
                      url: 'https://www.etsy.com/sg-en/listing/1283037690/rouleau-de-cuisine-reutilisable-chiffons'
                    ),
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/18244890/r/il/ac8d72/5405032782/il_794xN.5405032782_c0qh.jpg",
                      nomArticle: "Natural Beauty Hamper",
                      price: "SGD 83.76",
                      url: 'https://www.etsy.com/sg-en/listing/1322650751/panier-de-beaute-naturel-kit-de-soins'
                    ),
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/21078302/r/il/ba902f/3569206719/il_794xN.3569206719_9f4c.jpg",
                      nomArticle: "Reusable Ear Buds",
                      price: "SGD 11.85",
                      url: 'https://www.etsy.com/sg-en/listing/1136330603/embout-q-reutilisable-en-bambou-avec'
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/7659841/r/il/d34b8e/5236329344/il_794xN.5236329344_na4l.jpg",
                      nomArticle: "Washable Sponge",
                      price: "SGD 18.34",
                      url: 'https://www.etsy.com/sg-en/listing/1417496225/eponge-lavable-un-accessoire-parfait'
                    ),
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/19893040/r/il/63643f/4656506748/il_794xN.4656506748_1o1j.jpg",
                      nomArticle: "Bamboo Toothbrushes",
                      price: "SGD 7.16",
                      url: 'https://www.etsy.com/sg-en/listing/961794247/brosses-a-dents-en-bambou-100-matieres'
                    ),
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/34097268/r/il/a53167/5684005381/il_794xN.5684005381_9gs1.jpg",
                      nomArticle: "Reusable paper towels",
                      price: "SGD 19.56",
                      url: 'https://www.etsy.com/sg-en/listing/1634506066/serviettes-sans-papier-serviettes-en'
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/23690462/r/il/3e1720/4817065201/il_794xN.4817065201_ab4s.jpg",
                      nomArticle: "Natural Dish Brush Set",
                      price: "SGD 50.43",
                      url: 'https://www.etsy.com/sg-en/listing/1435661956/ensemble-de-brosses-a-vaisselle-zero'
                    ),
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/45039598/r/il/c9688b/5677934855/il_794xN.5677934855_f5wh.jpg",
                      nomArticle: "Tote Bag",
                      price: "SGD 25.21",
                      url: 'https://www.etsy.com/sg-en/listing/1647018963/sac-fourre-tout-pour-albums-esthetique'
                    ),
                    PlanetSortMarketplaceItem(
                      imagePath: "https://i.etsystatic.com/20877256/r/il/bac9b9/2202192583/il_794xN.2202192583_otxl.jpg",
                      nomArticle: "Reusable organic cotton",
                      price: "SGD 10.92",
                      url: 'https://www.etsy.com/sg-en/listing/770869651/rondes-de-coton-bio-reutilisables-lune'
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 45.0)),
              ]
            )
          ],
        )
      )
    );
  }
}