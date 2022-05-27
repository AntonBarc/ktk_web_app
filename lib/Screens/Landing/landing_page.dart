import 'package:flutter/material.dart';
import 'package:ktk_web/Screens/Authorization/auth_screen.dart';
import 'package:ktk_web/Screens/Home/home_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;

    return isLoggedIn ? AuthScreen() : HomeScreen();
  }
}
