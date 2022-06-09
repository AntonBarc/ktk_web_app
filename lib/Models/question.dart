import 'package:flutter/foundation.dart';

class Question {
  final String title;
  final List<Map> answers;

  Question({required this.title, required this.answers});
}

class QuestionData {
  final _data = [
    Question(title: '1+1?', answers: [
      {'answer': '2', 'isCorrect': 1},
      {'answer': '3'},
      {'answer': '1'},
      {'answer': '0'},
    ]),
    Question(title: 'Какой цвет?', answers: [
      {'answer': 'Зеленый'},
      {'answer': 'Красный'},
      {'answer': 'Синий'},
      {'answer': 'Черный', 'isCorrect': 1},
    ]),
    Question(title: 'Группа?', answers: [
      {'answer': 'Металлика'},
      {'answer': 'Линкин парк', 'isCorrect': 1},
      {'answer': 'Раммштайн'},
      {'answer': 'Слипнот'},
    ]),
    Question(title: 'Год?', answers: [
      {'answer': '2001', 'isCorrect': 1},
      {'answer': '3027'},
      {'answer': '1981'},
      {'answer': '0010'},
    ]),
    Question(title: 'Животное?', answers: [
      {'answer': 'Тигр'},
      {'answer': 'Лев'},
      {'answer': 'Козёл', 'isCorrect': 1},
      {'answer': 'Баран'},
    ]),
  ];

  List<Question> get questions => [..._data];
}
