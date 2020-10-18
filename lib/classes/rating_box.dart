import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:surfboard_rating_pwa/services/firestore.dart';

class RatingBox extends StatefulWidget {

  String surfboard;

  RatingBox(this.surfboard);

  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {

  int _rating = 0;

  FirestoreHandle _firestore = FirestoreHandle();

  void _setRatingOneStar(String user, String surfboard) {
    setState(() {
      _rating = 1;
    });
    _firestore.addRating(user, 1, surfboard);
  }
  void _setRatingTwoStar(String user, String surfboard) {
    setState(() {
      _rating = 2;
    });
    _firestore.addRating(user, 2, surfboard);
  }
  void _setRatingThreeStar(String user, String surfboard) {
    setState(() {
      _rating = 3;
    });
    _firestore.addRating(user, 3, surfboard);
  }
  void _setRatingFourStar(String user, String surfboard) {
    setState(() {
      _rating = 4;
    });
    _firestore.addRating(user, 4, surfboard);
  }
  void _setRatingFiveStar(String user, String surfboard) {
    setState(() {
      _rating = 5;
    });
    _firestore.addRating(user, 5, surfboard);
  }

  void _showContent() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign in'),
          content: Text('Please sign in to rate'),
          actions: [
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
        );
      }
    );
  }

  //@override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context); //needed later?
    final rating = Provider.of<QuerySnapshot>(context);
    print('ratings are:');
    for(var doc in rating.docs) {
      print(doc.data);
    }
    double _size = 20;
    return StreamProvider<QuerySnapshot>.value(
      value: _firestore.ratings,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          user != null ?
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        icon: (_rating >= 1 ?
                        Icon(Icons.star, size: _size,) :
                        Icon(Icons.star_border, size: _size)),
                        color: Colors.orange,
                        onPressed: () {
                          _setRatingOneStar(user.uid.toString(), widget.surfboard);
                        },
                        iconSize: _size,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        icon: (_rating >= 2 ?
                        Icon(Icons.star, size: _size,) :
                        Icon(Icons.star_border, size: _size)),
                        color: Colors.orange,
                        onPressed: () {
                          _setRatingTwoStar(user.uid.toString(), widget.surfboard);
                        },
                        iconSize: _size,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        icon: (_rating >= 3 ?
                        Icon(Icons.star, size: _size,) :
                        Icon(Icons.star_border, size: _size)),
                        color: Colors.orange,
                        onPressed: () {
                          _setRatingThreeStar(user.uid.toString(), widget.surfboard);
                        },
                        iconSize: _size,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        icon: (_rating >= 4 ?
                        Icon(Icons.star, size: _size,) :
                        Icon(Icons.star_border, size: _size)),
                        color: Colors.orange,
                        onPressed: () {
                          _setRatingFourStar(user.uid.toString(), widget.surfboard);
                        },
                        iconSize: _size,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        icon: (_rating >= 5 ?
                        Icon(Icons.star, size: _size,) :
                        Icon(Icons.star_border, size: _size)),
                        color: Colors.orange,
                        onPressed: () {
                          _setRatingFiveStar(user.uid.toString(), widget.surfboard);
                        },
                        iconSize: _size,
                      ),
                    ),
                  ]
                ),
              ],
            )
            :
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: (_rating >= 1 ?
                    Icon(Icons.star, size: _size,) :
                    Icon(Icons.star_border, size: _size)),
                    color: Colors.grey,
                    iconSize: _size,
                    onPressed: () {
                      _showContent();
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: (_rating >= 2 ?
                    Icon(Icons.star, size: _size,) :
                    Icon(Icons.star_border, size: _size)),
                    color: Colors.grey,
                    iconSize: _size,
                    onPressed: () {
                      _showContent();
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: (_rating >= 3 ?
                    Icon(Icons.star, size: _size,) :
                    Icon(Icons.star_border, size: _size)),
                    color: Colors.grey,
                    iconSize: _size,
                    onPressed: () {
                      _showContent();
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: (_rating >= 4 ?
                    Icon(Icons.star, size: _size,) :
                    Icon(Icons.star_border, size: _size)),
                    color: Colors.grey,
                    iconSize: _size,
                    onPressed: () {
                      _showContent();
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: (_rating >= 5 ?
                    Icon(Icons.star, size: _size,) :
                    Icon(Icons.star_border, size: _size)),
                    color: Colors.grey,
                    iconSize: _size,
                    onPressed: () {
                      _showContent();
                    },
                  ),
                ),
              ],
          ),
        ]
      ),
    );
  }
}
