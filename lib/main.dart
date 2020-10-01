import 'package:flutter/material.dart';
import 'package:surfboard_rating_pwa/classes/product_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Surfboard Ratings') /*MyHomePage(title: 'Flutter Demo Home Page')*/,
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rate Haydenshapes Boards')),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBox(
            name: 'Hypto Krypto',
            description: 'Nice board',
            price: 600,
            image: 'Haydenshapes-Hypto-Krypto.jpg'
          ),
          ProductBox(
              name: 'Plunder',
              description: 'Another Nice board',
              price: 600,
              image: 'Haydenshapes-Plunder.jpg'
          ),
          ProductBox(
              name: 'Untitled',
              description: 'Intermediate Board',
              price: 600,
              image: 'Haydenshapes-Untitled.jpg'
          ),
          ProductBox(
              name: 'White Noiz',
              description: 'Advanced Board',
              price: 600,
              image: 'Haydenshapes-White-Noiz.jpg'
          ),
        ],
      ),
    );
  }
}
