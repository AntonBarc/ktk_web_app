// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../constant.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        ),
        onPressed: () {},
        child: Row(children: <Widget>[
          Icon(Icons.account_circle, color: sPrimaryColor),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
          ),
          Text(
            'Профиль'.toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              color: sTextColor,
            ),
          ),
        ]),
      ),
    );
  }
}
