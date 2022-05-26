import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ktk_web/Components/body_button.dart';
import 'package:ktk_web/constant.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
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
            padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 30),
            child: Text(
              'Выполните вход для продолжения',
              style: TextStyle(
                fontSize: 21,
                color: sTextColor.withOpacity(0.75),
              ),
            ),
          ),
          BodyButton(),
        ],
      ),
    );
  }
}
