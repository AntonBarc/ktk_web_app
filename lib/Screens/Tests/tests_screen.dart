import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Authorization/auth_screen.dart';
import 'Components/body.dart';
import '../Lectures/lectures_screen.dart';
import '../../constant.dart';
import 'Components/app_bar.dart';

class TestsScreen extends StatefulWidget {
  TestsScreen({Key? key}) : super(key: key);

  @override
  State<TestsScreen> createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.png'),
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
    );
  }
}
