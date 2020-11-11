import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfboard_rating_pwa/classes/loading.dart';
import 'package:surfboard_rating_pwa/classes/sign_in.dart';
import 'package:surfboard_rating_pwa/services/auth.dart';
import 'package:surfboard_rating_pwa/services/firestore.dart';
import 'classes/product.dart';
import 'classes/product_page.dart';
import 'classes/product_box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:adobe_xd/adobe_xd.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<User>.value(
            value: Auth().user,
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MyHomePage(title: 'Successfully logged in'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        return Loading();
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = Product.getProducts();
  final Auth _auth = Auth();
  //final FirestoreHandle _firestore = FirestoreHandle();
  User user;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rate Haydenshapes Boards',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: const Color(0xfff8f5f5),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(-0.98, 0.0),
              radius: 0.602,
              colors: [const Color(0xffa8dfe5), const Color(0xff4ba3a4)],
              stops: [0.0, 1.0],
              transform: GradientXDTransform(
                  1.0, 0.0, 0.0, 4.98, 0.0, -1.99, Alignment(-0.98, 0.0)),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child:
        user == null ?
        ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Not logged in',
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                ),
              ),
              decoration: BoxDecoration(
                color: const Color(0xffeec08a),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.login,
                color: Colors.white,
              ),
              title: Text(
                'Login',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              tileColor: const Color(0xffeec08a),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()
                  )
                );
              }
            )
          ],
        )
        :
        ListView(
        children: [
          user.isAnonymous == true ?
          UserAccountsDrawerHeader(
            accountName: Text(
              'Anonym',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            accountEmail: Text('nobody@anonym.com'),
            decoration: BoxDecoration(
              color: const Color(0xffeec08a),
            ),
          )
          :
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL),
            ),
            accountName: Text(user.displayName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            accountEmail: Text(user.email),
            decoration: BoxDecoration(
              color: const Color(0xffeec08a),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              ),
            ),
            tileColor: const Color(0xffeec08a),
            onTap: () async {
              await _auth.logOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()
                  )
              );
            },
          ),
        ],
      )
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductBox(item: items[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    item: this.items[index]
,                  )
                )
              );
            }
          );
        },
      ),
    );
  }
}
