// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../constant.dart';

class BodyButton extends StatelessWidget {
  const BodyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 220),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: sPrimaryColor,
          borderRadius: BorderRadius.circular(34),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 38,
              width: 38,
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
            SizedBox(width: 15),
            Text(
              "Войти".toUpperCase(),
              style: TextStyle(
                fontFamily: 'Roboto',
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
