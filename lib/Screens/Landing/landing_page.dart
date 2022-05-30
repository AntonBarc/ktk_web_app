import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ktk_web/Screens/Authorization/auth_screen.dart';
import 'package:ktk_web/Screens/Home/home_screen.dart';

import 'Components/app_bar.dart';
import 'Components/body.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return AuthScreen();
            }
          },
        ),
      );

//Size size = MediaQuery.of(context).size;
  /*{
    final bool isLoggedIn = false;
    Size size = MediaQuery.of(context).size;
    return isLoggedIn
        ? AuthScreen()
        : Scaffold(
            body: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bgi.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomAppBar(),
                  Spacer(),
                  Body(),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          );
  }*/
}
