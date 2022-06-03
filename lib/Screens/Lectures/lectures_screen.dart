import 'dart:html';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ktk_web/Screens/Authorization/auth_screen.dart';
import 'package:ktk_web/Screens/Home/home_screen.dart';
import 'Components/body.dart';
import 'package:ktk_web/constant.dart';
import 'Components/app_bar.dart';

class LecturesScreen extends StatefulWidget {
  LecturesScreen({Key? key}) : super(key: key);

  @override
  State<LecturesScreen> createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Study'),
    Text('Index 2: Test'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: _selectedIndex == 0
          ? HomeScreen()
          : Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bgw.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomAppBar(),
                  Body(),
                ],
              ),
            ),
      //footer
      bottomNavigationBar: CurvedNavigationBar(
        items: const <Widget>[
          Icon(Icons.home, color: kPrimaryColor),
          Icon(Icons.school, color: kPrimaryColor),
          Icon(Icons.check_circle, color: kPrimaryColor),
        ],
        index: 0,
        height: 50,
        color: sPrimaryColor,
        backgroundColor: Color.fromARGB(255, 22, 1, 170),
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 300),
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
