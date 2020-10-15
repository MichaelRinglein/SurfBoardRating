import 'dart:async';

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
              home: MyHomePage(title: 'Successfully logged in'), //MyHomePage(title: 'Surfboard Ratings') /*MyHomePage(title: 'Flutter Demo Home Page')*/,
            ),
          );
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
  final FirestoreHandle _firestore = FirestoreHandle();
  User user;


  @override
  Widget build(BuildContext context) {
    //print('_auth.user is: ' + _auth.cur); //not needed

    final user = Provider.of<User>(context);
    //print('user.uid on main.dart is: ' + user.toString());

    return Scaffold(
      appBar: AppBar(title: Text('Rate Haydenshapes Boards')),
      drawer: Drawer(
        child: ListView(
          children: [
            user == null ?
            UserAccountsDrawerHeader(
              accountName: Text('Anonym'),
              accountEmail: Text('nobody@anonym.com'),
            )
            :
            UserAccountsDrawerHeader(
                accountName: Text('uid: '+ user.uid),
                accountEmail: Text('token: ' + user.refreshToken),
            ),

            user == null ?
            ListTile(
                leading: Icon(Icons.login),
                title: Text('Login'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()
                      )
                  );
                }
            )
            :
            ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () async {
                  await _auth.logOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()
                    )
                  );
                },
            ),
            ListTile(
              leading: Icon(Icons.cloud_download_outlined),
              title: Text('Pull Rating from database'),
              onTap: () async {
                await _firestore.getRating(user.uid.toString(), 'Hypto Krypto');
              },
            ),
          ],
        ),
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
