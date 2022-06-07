import 'dart:html';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:ktk_web/Screens/Lectures/lectures_screen.dart';
import '../../../Components/body_button.dart';
import '../../Home/Components/footer_item.dart';
import '../../Home/Components/menu_item.dart';
import '../../../constant.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:file_picker/file_picker.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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

  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Кнопка "назад"
          ButtonTheme(
            splashColor: kPrimaryColor,
            highlightColor: sPrimaryColor,
            padding: EdgeInsets.symmetric(horizontal: 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(46)),
            child: SizedBox(
              width: 190,
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_back, color: kPrimaryColor, size: 28),
                      SizedBox(width: 10),
                      Text(
                        "Назад".toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LecturesScreen()));
                },
              ),
            ),
          ),

          SizedBox(height: 24),

          //прогресс-бар и кнопка
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 600,
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: <Widget>[
                    FittedBox(
                      child: Container(
                        height: 200,
                        width: 580,
                        padding:
                            EdgeInsets.symmetric(horizontal: 240, vertical: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 60),
                            Container(
                              height: 20,
                              width: 200,
                              child: LiquidLinearProgressIndicator(
                                value: progress / 100,
                                valueColor:
                                    AlwaysStoppedAnimation(kPrimaryColor),
                                backgroundColor: Colors.white,
                                direction: Axis.horizontal,
                                center: Text(
                                  '$progress%',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            ButtonTheme(
                              splashColor: kPrimaryColor,
                              highlightColor: sPrimaryColor,
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(34)),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) {
                                      return states
                                              .contains(MaterialState.pressed)
                                          ? kPrimaryColor
                                          : null;
                                    },
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          sPrimaryColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
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
                                    "Загрузить".toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    Uint8List? file = result.files.first.bytes;
                                    String fileName = result.files.first.name;

                                    UploadTask task = FirebaseStorage.instance
                                        .ref()
                                        .child("files/$fileName")
                                        .putData(file!);

                                    task.snapshotEvents.listen((event) {
                                      setState(() {
                                        progress = ((event.bytesTransferred
                                                        .toDouble() /
                                                    event.totalBytes
                                                        .toDouble()) *
                                                100)
                                            .roundToDouble();
                                        print(progress);
                                      });
                                      if (event.bytesTransferred ==
                                          event.totalBytes) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            'Загружен материал ${fileName}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: tTextColor,
                                                fontSize: 18,
                                                fontFamily: 'Roboto'),
                                          ),
                                          backgroundColor: Colors.white,
                                          duration: Duration(seconds: 3),
                                        ));
                                      }
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//   Future createLecture({required String name, required String desc}) async {
//     final docLecture = FirebaseFirestore.instance.collection('lectures').doc();

//     final lecture = Lecture(
//       id: docLecture.id,
//       name: name,
//       desc: desc,
//     );
//     final json = lecture.toJson();

//     await docLecture.set(json);
//   }
// }

// class Lecture {
//   String id;
//   final String name;
//   final String desc;

//   Lecture({
//     this.id = '',
//     required this.name,
//     required this.desc,
//   });

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'desc': desc,
//       };

//   static Lecture fromJson(Map<String, dynamic> json) => Lecture(
//         id: json['id'],
//         name: json['name'],
//         desc: json['desc'],
//       );
}
