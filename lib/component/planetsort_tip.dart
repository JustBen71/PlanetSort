import 'package:flutter/material.dart';
import 'package:planetsort/locator.dart';
import 'package:planetsort/repository/tip_app_singleton.dart';
import 'package:planetsort/utils/constant.dart';
import 'package:planetsort/view_model/tip_view_model.dart';

class TipWidget extends StatefulWidget {
  const TipWidget({super.key});

  @override
  _TipWidgetState createState() => _TipWidgetState();
}

class _TipWidgetState extends State<TipWidget> {
  bool _isVisible = true; // Initialized to true so that the widget is visible initially
  TipSingleton appState = locator.get();
  final TipViewModel viewModel = locator.get();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.readJson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Loading is complete, you can access the data here
          // Use snapshot.data to access the result of the readJson() method
          // Return an empty Container if _isVisible is false
          if (!_isVisible) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = true;
                });
              },
              child: Card(
                color: beige,
                child: Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tip : ${appState.currentTip.category} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "RockNRoll",
                              color: green,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const Icon(
                            Icons.arrow_circle_down,
                            color: green,
                          ),
                        ]
                      )
                    ]
                  ),
                )
              )
            );
          }
          return Card(
            color: beige,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tip : ${appState.currentTip.category} ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: green,
                            fontFamily: "RockNRoll",
                          ),
                        ),
                        const Icon(
                          Icons.arrow_circle_up, 
                          color: green,
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                    Text(
                      appState.currentTip.tip,
                      style: const TextStyle(color: green, fontFamily: "RockNRoll", ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          // Show a loading indicator while the readJson() method executes
          return const CircularProgressIndicator();
        }
      },
    );
  }
}