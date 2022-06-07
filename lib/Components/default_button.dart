// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../constant.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        ),
        onPressed: () {},
        child: Text(
          'Войти'.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto',
            color: sTextColor,
          ),
        ),
      ),
    );
  }
}
