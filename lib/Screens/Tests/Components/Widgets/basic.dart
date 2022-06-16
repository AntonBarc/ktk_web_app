import 'package:flutter/material.dart';
import 'package:ktk_web/Models/question.dart';
import 'package:ktk_web/constant.dart';
import 'answer.dart';

class Basic extends StatelessWidget {
  final index;
  final questionData;
  final onChangeAnswer;

  const Basic({Key? key, this.index, this.questionData, this.onChangeAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          questionData.questions[index].title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: sTextColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        ...questionData.questions[index].answers
            .map((value) => Answer(
                  title: value['answer'],
                  onChangeAnswer: onChangeAnswer,
                  isCorrect: value.containsKey('isCorrect') ? true : false,
                ))
            .toList(),
      ],
    );
  }
}
