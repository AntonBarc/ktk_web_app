import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<kUser?> signInWithEmailAndPassword(
      String login, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: login, password: password);
      User? user = result.user;
      return kUser.fromFirebase(user!);
    } catch (e) {
      return null;
    }
  }

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
