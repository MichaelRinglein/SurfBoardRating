import 'package:flutter/material.dart';
import 'package:surfboard_rating_pwa/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login In / Sign Up'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Sign in anonymously'),
              onPressed: () {
                _auth.loginAnonym();
              },
            ),
            RaisedButton(
              child: Text('Logout'),
              onPressed: () {
                _auth.logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
