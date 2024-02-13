import 'package:flutter/material.dart';

import 'package:planetsort/object/BottomAppBarItem.dart';
import 'package:planetsort/utils/constant.dart';

class PlanetSortCustomNavBar extends StatelessWidget {
  final List<BottomAppBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const PlanetSortCustomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          return InkWell(
            onTap: () {
              onTap(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(items[index].icon,
                    color: index == currentIndex ? green : dark),
                Text(items[index].label,
                    style: TextStyle(
                      color: index == currentIndex ? green : dark,
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }
}
