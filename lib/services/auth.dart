import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:surfboard_rating_pwa/classes/rating_box.dart';
import 'package:surfboard_rating_pwa/services/firestore.dart';

class Auth {

  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  Future loginAnonym() async {
    try {
      await _auth.signInAnonymously();
    } catch(e) {
      print(e.toString());
    }
  }
  
  Future<UserCredential> loginWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    
    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });

    return await _auth.signInWithPopup(googleProvider);
  }

  Future logOut() async {
    try {
      await _auth.signOut();
    } catch(e) {
      print(e.toString());
    }
  }
}
