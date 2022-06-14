// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../Components/default_button.dart';
import 'menu_item.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.75),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 25),
          Image.asset(
            'images/ico.png',
            height: 50,
            alignment: Alignment.topCenter,
          ),
          Spacer(),
          nMenuItem(
            title: 'Главная',
            // press: () {},
          ),
          nMenuItem(
            title: 'Уч. Материалы',
            // press: () {},
          ),
          nMenuItem(
            title: 'Тесты',
            // press: () {},
          ),
          DefaultButton(),
        ],
      ),
    );
  }
}
