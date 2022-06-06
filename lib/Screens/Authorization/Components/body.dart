// ignore_for_file: deprecated_member_use

import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ktk_web/Components/body_button.dart';
import 'package:ktk_web/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

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
        padding: EdgeInsets.symmetric(horizontal: 540),
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
              fontWeight: FontWeight.normal,
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

    Widget _button(
      String text,
      void func(),
    ) {
      return ElevatedButton(
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
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
              fontSize: 20),
        ),
        onPressed: () {
          func();
        },
      );
    }

    Widget _form(
      String label,
      void func(),
    ) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 40),
              child: _input(Icon(Icons.person), 'Email'.toUpperCase(),
                  _emailController, false),
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
              padding: EdgeInsets.symmetric(horizontal: 720),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }

    Future signIn() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }

    return Column(
      children: <Widget>[
        _logo(),
        _form('Войти'.toUpperCase(), signIn),
      ],
    );
  }
}
