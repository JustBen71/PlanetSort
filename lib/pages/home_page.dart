import 'package:flutter/material.dart';
import 'package:planetsort/component/PlanetSortCustomNavBar.dart';
import 'package:planetsort/component/planetsort_text.dart';
import 'package:planetsort/utils/constant.dart';

import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
          
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        title: const PlanetSortText(
          data: 'Welcome Mathilde' ,
          fontSize: sizetitle,
        ),
        backgroundColor: green,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        color: green,
        child: const Column(
          children: <Widget> [
            PlanetSortText(
                data: 'You need to scan 3 more wastes',
                fontSize: sizetitle2,
            ),
            Card(
              color: beige,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(80), topRight: Radius.circular(80), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
              child: ListTile(

                title: Center( 
                  child: PlanetSortText(
                    data: 'Daily Tips',
                    color: green,
                    fontSize: paragraph,
                  ),
                ),
                subtitle: PlanetSortText(
                    data: 'Use public transportation or prefer walking or cycling to reduce your carbon footprint. Use public transportation or prefer walking or cycling to reduce your carbon footprint.',
                    color: green,
                    fontSize: paragraph,
                  ),
                /*trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {},
                ),*/
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
