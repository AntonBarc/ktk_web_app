import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ktk_web/Components/body_button.dart';
import 'package:ktk_web/constant.dart';

class Body extends StatelessWidget {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text(
              'Авторизация'.toUpperCase(),
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: sPrimaryColor,
              ),
            ),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 540, right: 540),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            color: sPrimaryColor,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: sPrimaryColor,
            ),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: sPrimaryColor, width: 4),
              borderRadius: BorderRadius.circular(46),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: sPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(46),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: sPrimaryColor),
                child: icon,
              ),
            ),
          ),
        ),
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 40),
              child: _input(Icon(Icons.person), 'Логин'.toUpperCase(),
                  _loginController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(Icon(Icons.lock), 'Пароль'.toUpperCase(),
                  _passwordController, true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text(label),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: <Widget>[
        _logo(),
        _form('Войти'.toUpperCase(), () {}),
      ],
    );
  }
}
