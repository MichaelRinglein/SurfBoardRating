import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.authStateChanges();
    /*
      .listen((User user) {
        if(user == null) {
          print('User is logged out');
        } else {
          print('User is logged in:');
          print(user.uid);
          return user;
        }
    });
    */
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

  /*
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User user) {
  if (user == null) {
  print('User is currently signed out!');
  } else {
  print('User is signed in!');
  }
  });
   */

}
