// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ktk_web/Screens/Authorization/auth_screen.dart';
import 'package:ktk_web/Screens/Home/home_screen.dart';

import '/../constant.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 220),
        child: ButtonTheme(
          splashColor: kPrimaryColor,
          highlightColor: sPrimaryColor,
          padding: EdgeInsets.symmetric(horizontal: 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(46)),
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith(
                (states) {
                  return states.contains(MaterialState.pressed)
                      ? kPrimaryColor
                      : null;
                },
              ),
              backgroundColor: MaterialStateProperty.all<Color>(sPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(34),
                ),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.help, color: kPrimaryColor, size: 35),
                  SizedBox(width: 15),
                  Text(
                    "Помощь".toUpperCase(),
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
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
