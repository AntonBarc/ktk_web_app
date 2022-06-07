import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Authorization/auth_screen.dart';
import '../CreateLecture/create_lecture.dart';
import '../Home/home_screen.dart';
import '../Lectures/lectures_screen.dart';

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
}
