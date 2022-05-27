import 'package:firebase_auth/firebase_auth.dart';

class kUser {
  late String id;

  kUser.fromFirebase(User user) {
    id = user.uid;
  }
}
