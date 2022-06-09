import 'package:flutter/material.dart';
import 'package:ktk_web/constant.dart';

class Answer extends StatelessWidget {
  final String title;
  final isCorrect;
  final Function onChangeAnswer;
  const Answer(
      {Key? key,
      required this.title,
      this.isCorrect,
      required this.onChangeAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChangeAnswer(isCorrect),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
        padding: EdgeInsets.all(10),
        width: 500,
        decoration: BoxDecoration(
          color: sPrimaryColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
