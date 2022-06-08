import 'dart:html' as webFile;
import 'dart:convert';
import 'dart:js' as js;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import '../../../Components/body_button.dart';
import '../../CreateLecture/create_lecture.dart';
import '../../Home/Components/footer_item.dart';
import '../../Home/Components/menu_item.dart';
import '../../../constant.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_core/firebase_core.dart';
import '../../../main.dart';
import 'package:file_picker/file_picker.dart';

import '../../CreateLecture/Components/body.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<ListResult> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/files').listAll();
  }

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Кнопка "создать лекцию"
          ButtonTheme(
            splashColor: kPrimaryColor,
            highlightColor: sPrimaryColor,
            padding: EdgeInsets.symmetric(horizontal: 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(46)),
            child: SizedBox(
              width: 384,
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
                      Icon(Icons.add_circle, color: kPrimaryColor, size: 28),
                      SizedBox(width: 15),
                      Text(
                        "Загрузить материал".toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateLectureScreen()));
                },
              ),
            ),
          ),

          SizedBox(height: 42),

          //Список лекций
          Container(
            height: 400,
            child: FutureBuilder<ListResult>(
              future: futureFiles,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final files = snapshot.data!.items;

                  return ListView.builder(
                    itemCount: files.length,
                    itemBuilder: (BuildContext context, int index) {
                      final file = files[index];
                      return ListTile(
                        title: Text(
                          file.name,
                          style: TextStyle(
                              color: sTextColor,
                              fontFamily: 'Roboto',
                              fontSize: 24),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.download,
                            size: 28,
                          ),
                          color: sPrimaryColor,
                          onPressed: () {
                            if (kIsWeb) {
                              var blob = webFile.Blob(
                                  ["data"], 'text/plain', 'native');

                              var anchorElement = webFile.AnchorElement(
                                href: webFile.Url.createObjectUrlFromBlob(blob)
                                    .toString(),
                              )
                                ..setAttribute("download", '${file.name}')
                                ..click();
                            }
                          },
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    'Что-то пошло не так!',
                    style: TextStyle(
                        color: sTextColor, fontFamily: 'Roboto', fontSize: 24),
                  ));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

//   Widget buildLecture(Lecture lecture) => ListTile(
//         textColor: Colors.white,
//         leading: CircleAvatar(child: Text('${lecture.id}')),
//         title: Text(lecture.name),
//         subtitle: Text(lecture.desc),
//       );

//   Stream<List<Lecture>> readLectures() => FirebaseFirestore.instance
//       .collection('lectures')
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => Lecture.fromJson(doc.data())).toList());
}
