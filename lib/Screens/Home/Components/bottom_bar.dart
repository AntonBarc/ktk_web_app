// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ktk_web/Screens/Home/Components/footer_item.dart';
import '../../../Components/account_button.dart';
import '../../../Components/default_button.dart';
import '../../../constant.dart';
import 'menu_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: <Widget>[
            SizedBox(width: 25),
            footItem(
              title: 'Главная',
              press: () {},
            ),
            footItem(
              title: 'Уч. Материалы',
              press: () {},
            ),
            footItem(
              title: 'Тесты',
              press: () {},
            ),
            footItem(
              title: 'Помощь',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
