import 'package:flutter/material.dart';

import '../../../constant.dart';

class kMenuItem extends StatelessWidget {
  final String title;
  final Function press;
  const kMenuItem({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press(),
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
