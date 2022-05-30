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
        padding: EdgeInsets.symmetric(horizontal: 220),
        child: ButtonTheme(
          splashColor: kPrimaryColor,
          highlightColor: sPrimaryColor,
          padding: EdgeInsets.symmetric(horizontal: 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(46)),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(sPrimaryColor),
            ),
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
              ),
              child: Row(
                children: <Widget>[
                  //Элемент с кружками
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
          ),
        ),
      ),
    );
  }
}
