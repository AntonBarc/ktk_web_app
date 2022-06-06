import 'dart:html';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:ktk_web/Components/body_button.dart';
import 'package:ktk_web/Screens/Home/Components/footer_item.dart';
import 'package:ktk_web/Screens/Home/Components/menu_item.dart';
import 'package:ktk_web/constant.dart';

import '../../CreateLecture/Components/body.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder<List<Lecture>>(
            stream: readLectures(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Что-то пошло не так!');
              } else if (snapshot.hasData) {
                final lecture = snapshot.data!;
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: lecture.map(buildLecture).toList(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildLecture(Lecture lecture) => ListTile(
        textColor: Colors.white,
        leading: CircleAvatar(child: Text('${lecture.id}')),
        title: Text(lecture.name),
        subtitle: Text(lecture.desc),
      );

  Stream<List<Lecture>> readLectures() => FirebaseFirestore.instance
      .collection('lectures')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Lecture.fromJson(doc.data())).toList());
}
