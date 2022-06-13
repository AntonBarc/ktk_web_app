import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ktk_web/Models/question.dart';
import 'package:ktk_web/Screens/Tests/Components/Widgets/answer.dart';
import 'package:ktk_web/Screens/Tests/Components/Widgets/basic.dart';
import 'package:ktk_web/Screens/Tests/Components/Widgets/progress_bar.dart';
import 'package:ktk_web/Screens/Tests/Components/Widgets/result.dart';
import '../../../Components/body_button.dart';
import 'footer_item.dart';
import 'menu_item.dart';
import '../../../constant.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final QuestionData data = QuestionData();
  int _countResult = 0;
  int _questionIndex = 0;

  List<Icon> _icons = [];

  void _clearState() => setState(() {
        _questionIndex = 0;
        _countResult = 0;
        _icons = [];
      });

  void _onChangeAnswer(bool isCorrect) => setState(() {
        if (isCorrect) {
          _icons.add(Icon(
            Icons.check,
            color: Colors.green,
            size: 32,
          ));
          _countResult++;
        } else {
          _icons.add(Icon(
            Icons.clear,
            color: Colors.red,
            size: 32,
          ));
        }
        _questionIndex += 1;
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProgressBar(
              icons: _icons,
              count: _questionIndex,
              total: data.questions.length,
            ),
            _questionIndex < data.questions.length
                ? Basic(
                    index: _questionIndex,
                    questionData: data,
                    onChangeAnswer: _onChangeAnswer,
                  )
                : Result(
                    count: _countResult,
                    total: data.questions.length,
                    onClearState: _clearState,
                  ),
          ],
        ),
      ),
    );
  }
}
