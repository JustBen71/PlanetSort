import 'package:flutter/material.dart';
import 'package:planetsort/component/PlanetSortCustomNavBar.dart';
import 'package:planetsort/component/TitleText.dart';
import 'package:planetsort/utils/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        title: const TitleText(
          data: 'Welcome Mathilde',
          fontSize: 55,
        ),
        backgroundColor: green,
        centerTitle: true,
      ),
      body: Container(
        color: green,
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'You need to scan 3 more wastes',
                style: TextStyle(),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Daily Tips'),
                subtitle: const Text(
                    'Use public transportation or prefer walking or cycling to reduce your carbon footprint.'),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {},
                ),
              ),
            ),
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
        ),
      ),
      bottomNavigationBar: const PlanetSortCustomNavBar(),
    );
  }
}
