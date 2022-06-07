import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Authorization/auth_screen.dart';
import 'Components/body.dart';
import '../../constant.dart';
import 'Components/app_bar.dart';

class CreateLectureScreen extends StatefulWidget {
  CreateLectureScreen({Key? key}) : super(key: key);

  @override
  State<CreateLectureScreen> createState() => _CreateLectureScreenState();
}

class _CreateLectureScreenState extends State<CreateLectureScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
