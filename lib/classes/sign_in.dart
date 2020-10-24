import 'package:flutter/material.dart';
import 'package:surfboard_rating_pwa/main.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Login Anonymously'),
              onPressed: () async {
                await _auth.loginAnonym();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Successfully logged in')),
                );
              },
            ),
            RaisedButton(
              child: Text('Login with Google'),
              onPressed: () async {
                await _auth.loginWithGoogle();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Successfully logged in')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
