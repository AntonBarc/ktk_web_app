import 'package:flutter/foundation.dart';

class Question {
  final String title;
  final List<Map> answers;

  Question({required this.title, required this.answers});
}

class QuestionData {
  final _data = [
    Question(
        title:
            'Cистема точных и понятных предписаний о содержании и последовательности выполнения конечного числа действий, необходимых для решения любой задачи данного типа',
        answers: [
          {'answer': 'Алгоритм', 'isCorrect': 1},
          {'answer': 'Цепочка'},
          {'answer': 'Команда'},
          {'answer': 'Функция'},
        ]),
    Question(title: 'Указание совершить некоторое действие', answers: [
      {'answer': 'Запрос'},
      {'answer': 'Процесс'},
      {'answer': 'Функция'},
      {'answer': 'Команда', 'isCorrect': 1},
    ]),
    Question(title: 'Какие виды алгоритмов существуют?', answers: [
      {'answer': 'Нелинейные, ветвящиеся, циклические'},
      {'answer': 'Линейные, ветвящиеся, циклические', 'isCorrect': 1},
      {'answer': 'Ветвящиеся, циклические'},
      {'answer': 'Линейные, ветвящиеся, циклические, возвратные'},
    ]),
    Question(
        title:
            'Функция, которая вычисляет результат логического выражения и возвращает одно значение для true (истина) и другое для false (ложь), именуется как...',
        answers: [
          {'answer': 'if', 'isCorrect': 1},
          {'answer': 'try'},
          {'answer': 'else'},
          {'answer': 'void'},
        ]),
    Question(title: 'Какой код здесь верный?', answers: [
      {'answer': 'void() func{}'},
      {'answer': 'if{i == 1} (i++)'},
      {'answer': 'try{n = 2;} catch{}', 'isCorrect': 1},
      {'answer': 'int() array = new int() [1, 2, 3]'},
    ]),
  ];

  List<Question> get questions => [..._data];
}
