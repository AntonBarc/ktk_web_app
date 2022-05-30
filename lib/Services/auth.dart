import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future logOut() async {
    await _fAuth.signOut();
  }

  /*Stream<kUser> get currentUser {
    return _fAuth
        .authStateChanges()
        .map((User user) => user != null ? kUser.FromFirebase(user) : null);
  }
*/
}
