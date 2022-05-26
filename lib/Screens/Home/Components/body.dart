import 'dart:html';

import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
            child: Text(
              'Выполните вход для продолжения',
              style: TextStyle(
                fontSize: 21,
                color: sTextColor.withOpacity(0.75),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160),
            child: FittedBox(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: sPrimaryColor,
                    borderRadius: BorderRadius.circular(34)),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 38,
                      width: 38,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: sPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Войти'.toUpperCase(),
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
