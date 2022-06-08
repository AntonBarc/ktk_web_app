import 'dart:html';

import 'package:flutter/material.dart';
import '../../../Components/body_button.dart';
import 'footer_item.dart';
import 'menu_item.dart';
import '../../../constant.dart';

import 'Buttons/exit_button.dart';
import 'Buttons/lectures_button.dart';
import 'Buttons/main_button.dart';
import 'Buttons/test_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
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
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          Column(
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
        ],
      ),
    );
  }
}
