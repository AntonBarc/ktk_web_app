import 'package:flutter/material.dart';
import 'package:ktk_web/constant.dart';

class ProgressBar extends StatelessWidget {
  final icons;
  final count;
  final total;
  ProgressBar({
    Key? key,
    required this.icons,
    required this.count,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Вопрос: $count из $total',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: sPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ...icons,
        ],
      ),
    );
  }
}
