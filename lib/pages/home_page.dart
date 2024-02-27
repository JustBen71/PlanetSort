import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planetsort/component/planetsort_tip.dart';

import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/utils/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";

  @override
  void initState()
  {
    super.initState();
    _loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Future<void> _loadUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        username = userData['firstName'];
      });
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: PlanetSortTitleText(
        data: 'Welcome $username',
        fontSize: sizetitle,
      ),
      backgroundColor: green,
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      alignment: Alignment.center,
      color: green,
      child: const Column(
        children: <Widget>[
          PlanetSortTitleText(
            data: 'You need to scan 3 more wastes',
            fontSize: sizetitle2,
          ),
          TipWidget(),
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
      ));
  }
}