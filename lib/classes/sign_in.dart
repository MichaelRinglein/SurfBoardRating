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
          title: Text('Login In / Sign Up'),
          backgroundColor: const Color(0xff4ba3a4),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Rate your Surfboard',
                style: TextStyle(
                  fontFamily: 'Impact',
                  fontSize: 18,
                  color: const Color(0xff4ba3a4),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox( height: 130 ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                color: const Color(0xe6f2ca9a),
                padding: EdgeInsets.all(20),
                child: Text(
                  'Login Anonymously',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () async {
                  await _auth.loginAnonym();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: 'Successfully logged in')),
                  );
                },
              ),
              SizedBox( height: 20 ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                color: const Color(0xe6f2ca9a),
                padding: EdgeInsets.all(20),
                child: Text(
                  'Login with Google',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
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
