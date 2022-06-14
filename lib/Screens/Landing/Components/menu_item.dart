import 'package:flutter/material.dart';
import 'package:ktk_web/Screens/Home/home_screen.dart';
import 'package:ktk_web/Screens/Lectures/lectures_screen.dart';
import 'package:ktk_web/Screens/Tests/tests_screen.dart';

import '../../../constant.dart';

class hMenuItem extends StatelessWidget {
  final String title;
  // final Function press;
  const hMenuItem({
    Key? key,
    required this.title,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Roboto',
            color: kTextColor.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class lMenuItem extends StatelessWidget {
  final String title;
  // final Function press;
  const lMenuItem({
    Key? key,
    required this.title,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LecturesScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Roboto',
            color: kTextColor.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class nMenuItem extends StatelessWidget {
  final String title;
  // final Function press;
  const nMenuItem({
    Key? key,
    required this.title,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LecturesScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Roboto',
            color: kTextColor.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class tMenuItem extends StatelessWidget {
  final String title;
  // final Function press;
  const tMenuItem({
    Key? key,
    required this.title,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TestsScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Roboto',
            color: kTextColor.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
