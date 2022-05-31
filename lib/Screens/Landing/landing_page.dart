import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ktk_web/Screens/Authorization/auth_screen.dart';
import 'package:ktk_web/Screens/CreateLecture/create_lecture.dart';
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
              return CreateLectureScreen();
            } else {
              return AuthScreen();
            }
          },
        ),
      );
}
