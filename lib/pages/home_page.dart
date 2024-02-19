import 'package:flutter/material.dart';

import 'package:planetsort/utils/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showDailyTips = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Mathilde'),
        backgroundColor: green,
      ),
      body: Column(
        children: [
          if (_showDailyTips)
            Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: const Text('Daily Tips'),
                subtitle: const Text(
                    'Use public transportation or prefer environmentally friendly means of transportation. ...'),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _showDailyTips = false;
                    });
                  },
                ),
              ),
            ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Last wastes scanned'),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(3, (index) {
                return Card(
                  child: Image.network('https://via.placeholder.com/150'),
                );
              }),
            ),
          ),
        ],
      ),
      //bottomNavigationBar: const Navbar()
    );
  }
}
