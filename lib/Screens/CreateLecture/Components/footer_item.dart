import 'package:flutter/material.dart';

import '../../../constant.dart';

class footItem extends StatelessWidget {
  final String title;
  final Function press;
  const footItem({
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
          title,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: sTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
