import 'package:flutter/material.dart';

import 'package:planetsort/component/planetsort_custom_navbar.dart';
import 'package:planetsort/component/planetsort_text_normal.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/utils/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
        title: const PlanetSortTitleText(
          data: 'Welcome Mathilde',
          fontSize: sizetitle,
        ),
        backgroundColor: green,
        centerTitle: true,
    );
  }

  Widget _buildBody(){
    return Container(
        alignment: Alignment.center,
        color: green,
        child: const Column(
          children: <Widget>[
            PlanetSortTitleText(
              data: 'You need to scan 3 more wastes',
              fontSize: sizetitle2,
            ),
            /*Card(
              color: beige,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: ListTile(
                title: Center(
                  child: PlanetSortTitleText(
                    data: 'Daily Tips',
                    color: green,
                    fontSize: sizetitle3,
                  ),
                ),
                subtitle: PlanetSortText(
                  data:
                      'Use public transportation or prefer walking or cycling to reduce your carbon footprint. Use public transportation or prefer walking or cycling to reduce your carbon footprint.',
                  color: green,
                  fontSize: paragraph,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: null,
                ),
              ),
            ),*/
            /*Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(3, (index) {
                  return Card(
                    child: Image.asset(''),
                  );
                }),
              ),
            ),*/
          ],
        )
    );
  }
}
