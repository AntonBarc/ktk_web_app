// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../constant.dart';

class BodyButton extends StatelessWidget {
  const BodyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: FlatButton(
        padding: const EdgeInsets.symmetric(horizontal: 160),
        onPressed: () {},
        child: FittedBox(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: sPrimaryColor, borderRadius: BorderRadius.circular(34)),
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
      ),
    );
  }
}
