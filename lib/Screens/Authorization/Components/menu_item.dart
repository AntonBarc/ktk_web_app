import 'package:flutter/material.dart';
import 'package:ktk_web/Screens/Home/home_screen.dart';
import 'package:ktk_web/Screens/Lectures/lectures_screen.dart';

import '../../../constant.dart';

class kMenuItem extends StatelessWidget {
  final String title;
  // final Function press;
  const kMenuItem({
    Key? key,
    required this.title,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
