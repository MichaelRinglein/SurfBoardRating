import 'package:flutter/material.dart';
import 'package:surfboard_rating_pwa/main.dart';
import 'package:surfboard_rating_pwa/services/auth.dart';
import 'package:adobe_xd/adobe_xd.dart';

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
            color: Color(0xFFE8F8FA),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
        image: DecorationImage(
          image: AssetImage('waves-login.png'),
          fit: BoxFit.contain,
          alignment: AlignmentDirectional.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Login In / Sign Up'),
          backgroundColor: const Color(0xff4ba3a4),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.5, 0.0),
                radius: 10,
                colors: [const Color(0xffa8dfe5), const Color(0xff4ba3a4)],
                stops: [0.0, 1.0],
                transform: GradientXDTransform(
                    1.0, 0.0, 0.0, 4.98, 0.0, -1.99, Alignment(-0.98, 0.0)),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Rate Surfboards',
                    style: TextStyle(
                      fontFamily: 'Impact',
                      fontSize: 188,
                      color: const Color(0xff4ba3a4),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 130),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xe6f2ca9a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  padding: EdgeInsets.all(20),
                ),
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
                    MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage(title: 'Successfully logged in')),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xe6f2ca9a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  padding: EdgeInsets.all(20),
                ),
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
                    MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage(title: 'Successfully logged in')),
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
