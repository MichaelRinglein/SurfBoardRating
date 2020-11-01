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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:  Color(0xFFE8F8FA),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(
            'waves-login.png'
          ),
          fit: BoxFit.contain,
          alignment: AlignmentDirectional.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(0xFFA8DFE5),
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
      ),
    );
  }
}
