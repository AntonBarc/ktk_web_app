import 'package:flutter/material.dart';
import 'package:ktk_web/constant.dart';

class Result extends StatelessWidget {
  final int count;
  final int total;
  final VoidCallback onClearState;
  Result(
      {Key? key,
      required this.count,
      required this.total,
      required this.onClearState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg = '';

    if (0 <= count && count <= 2) {
      msg = 'Ваша оценка 2';
    } else if (3 == count) {
      msg = 'Ваша оценка 3';
    } else if (4 == count) {
      msg = 'Ваша оценка 4';
    } else {
      msg = 'Ваша оценка 5';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                msg,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: sTextColor, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Вы ответили верно на $count вопроса из $total',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: sTextColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
            FittedBox(
              child: Container(
                width: 920,
                padding: EdgeInsets.symmetric(horizontal: 220),
                child: ButtonTheme(
                  splashColor: kPrimaryColor,
                  highlightColor: sPrimaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(46)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return states.contains(MaterialState.pressed)
                              ? kPrimaryColor
                              : null;
                        },
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(sPrimaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34),
                        ),
                      ),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 69),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.repeat, color: kPrimaryColor, size: 35),
                          SizedBox(width: 5),
                          Text(
                            "Пройти еще раз".toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                    onPressed: onClearState,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
