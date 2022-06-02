import 'dart:html';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:ktk_web/Components/body_button.dart';
import 'package:ktk_web/Screens/Home/Components/footer_item.dart';
import 'package:ktk_web/Screens/Home/Components/menu_item.dart';
import 'package:ktk_web/constant.dart';
import 'package:dwds/dwds.dart';

import 'Buttons/exit_button.dart';
import 'Buttons/lectures_button.dart';
import 'Buttons/main_button.dart';
import 'Buttons/test_button.dart';

class Body extends StatelessWidget {
  InputDecoration decoration(String label) => InputDecoration(
        labelStyle: TextStyle(color: Colors.white, fontSize: 24),
        labelText: label,
        enabledBorder: const UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      );

  final controllerName = TextEditingController();
  final controllerDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 700,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                TextField(
                  controller: controllerName,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  cursorColor: Colors.white,
                  decoration: decoration('Название'),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: controllerDesc,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  cursorColor: Colors.white,
                  decoration: decoration('Описание'),
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  minLines: 1,
                ),
                const SizedBox(height: 24),
                FittedBox(
                  child: Container(
                    height: 16,
                    width: 560,
                    padding: EdgeInsets.symmetric(horizontal: 240),
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34),
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                          ),
                          child: Text(
                            "Создать".toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        onPressed: () {
                          final name = controllerName.text;
                          final desc = controllerDesc.text;
                          createLecture(name: name, desc: desc);
                          controllerName.clear();
                          controllerDesc.clear();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future createLecture({required String name, required String desc}) async {
    final docLecture = FirebaseFirestore.instance.collection('lectures').doc();

    final lecture = Lecture(
      id: docLecture.id,
      name: name,
      desc: desc,
    );
    final json = lecture.toJson();

    await docLecture.set(json);
  }
}

class Lecture {
  String id;
  final String name;
  final String desc;

  Lecture({
    this.id = '',
    required this.name,
    required this.desc,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'desc': desc,
      };
}
