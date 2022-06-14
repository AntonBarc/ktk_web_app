// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/../constant.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 812,
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
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app, color: kPrimaryColor, size: 35),
                  SizedBox(width: 15),
                  Text(
                    "Выход".toUpperCase(),
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
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ),
      ),
    );
  }
}
