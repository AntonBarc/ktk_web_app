import 'dart:html' as html;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../CreateLecture/create_lecture.dart';
import '../../../constant.dart';
import 'package:firebase_core/firebase_core.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<ListResult> futureFiles;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/files').listAll();
  }

  Future<void> delete(String ref) async {
    await firebaseStorage.ref(ref).delete();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
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
                        "Добавить материал".toUpperCase(),
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
            height: 500,
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
                        trailing: Wrap(
                          spacing: 20,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.download,
                                size: 28,
                              ),
                              color: sPrimaryColor,
                              onPressed: () {
                                if (file.name == 'Тема 1-1.doc') {
                                  downloadFile('/assets/lib/Тема 1-1.doc');
                                } else if (file.name == 'Тема 1-2.doc') {
                                  downloadFile('/assets/lib/Тема 1-2.doc');
                                } else if (file.name == 'Тема 1-3.docx') {
                                  downloadFile('/assets/lib/Тема 1-3.docx');
                                } else if (file.name == 'Тема 1-4.docx') {
                                  downloadFile('/assets/lib/Тема 1-4.docx');
                                } else if (file.name == 'Тема 1-5.docx') {
                                  downloadFile('/assets/lib/Тема 1-5.docx');
                                } else if (file.name ==
                                    'Лабораторная работа №1.pdf') {
                                  downloadFile(
                                      '/assets/lib/Лабораторная работа №1.pdf');
                                } else if (file.name ==
                                    'Лабораторная работа №2.pdf') {
                                  downloadFile(
                                      '/assets/lib/Лабораторная работа №2.pdf');
                                } else if (file.name ==
                                    'Лабораторная работа №3.pdf') {
                                  downloadFile(
                                      '/assets/lib/Лабораторная работа №3.pdf');
                                } else if (file.name ==
                                    'Лабораторная работа №4.pdf') {
                                  downloadFile(
                                      '/assets/lib/Лабораторная работа №4.pdf');
                                } else if (file.name ==
                                    'Языки и системы программирования.pptx') {
                                  downloadFile(
                                      '/assets/lib/Языки и системы программирования.pptx');
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 28,
                              ),
                              color: sPrimaryColor,
                              onPressed: () async {
                                await delete(file.fullPath);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    'Удалено ${file.name}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: tTextColor,
                                        fontSize: 18,
                                        fontFamily: 'Roboto'),
                                  ),
                                  backgroundColor: Colors.white,
                                  duration: Duration(seconds: 3),
                                ));
                              },
                            ),
                          ],
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
}

downloadFile(url) {
  html.AnchorElement anchorElement = new html.AnchorElement(href: url);
  anchorElement.download = '';
  anchorElement.click();
}
