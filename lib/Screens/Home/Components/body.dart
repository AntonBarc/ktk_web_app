import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ktk_web/Components/body_button.dart';
import 'package:ktk_web/Screens/Home/Components/footer_item.dart';
import 'package:ktk_web/Screens/Home/Components/menu_item.dart';
import 'package:ktk_web/constant.dart';

import 'Buttons/exit_button.dart';
import 'Buttons/lectures_button.dart';
import 'Buttons/main_button.dart';
import 'Buttons/test_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Основы алгоритмизации \nи программирования'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: sTextColor, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
          ),
          Padding(
            padding: EdgeInsets.only(right: 200),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  MainButton(),
                  SizedBox(height: 20),
                  LecturesButton(),
                  SizedBox(height: 20),
                  TestButton(),
                  SizedBox(height: 20),
                  ExitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
