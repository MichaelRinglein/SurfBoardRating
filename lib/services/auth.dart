import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  Future loginAnonym() async {
    try {
      await _auth.signInAnonymously();
      print(user);
    } catch(e) {
      print(e.toString());
    }
  }

  Future logOut() async {
    try {
      await _auth.signOut();
    } catch(e) {
      print(e.toString());
    }
  }
}
