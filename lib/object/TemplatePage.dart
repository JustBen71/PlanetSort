import 'dart:convert';
import 'dart:io';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:planetsort/object/BottomAppBarItem.dart';
import 'package:planetsort/component/TitleText.dart';
import 'package:planetsort/utils/constant.dart';
import '../component/PlanetSortCustomNavBar.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key, required this.title, required this.column, required this.center});
  final String title;
  final Column column;
  final bool center;

  @override
  State<TemplatePage> createState() =>
      _TemplatePage();
}

class _TemplatePage extends State<TemplatePage> {
  @override
  Widget build(BuildContext context)
  {
    int _currentIndex = 0;
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: GREEN,
      appBar: AppBar(
        backgroundColor: GREEN,
        title: Center( 
          child : TitleText(data: widget.title, color: BEIGE, fontSize: 50) 
          ),
      ),
      body: Center(
          child: widget.column
      ),
      bottomNavigationBar: PlanetSortCustomNavBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
        )
    );
  }
}