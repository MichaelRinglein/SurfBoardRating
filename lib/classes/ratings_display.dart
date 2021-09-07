import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:surfboard_rating_pwa/classes/sign_in.dart';
import 'package:surfboard_rating_pwa/services/firestore.dart';

class RatingDisplay extends StatefulWidget {
  final String surfboard;

  RatingDisplay(this.surfboard);

  @override
  _RatingDisplayState createState() => _RatingDisplayState();
}

class _RatingDisplayState extends State<RatingDisplay> {
  int _rating = 0;
  int _amountRatings = 0;
  double _averageRating = 0.0;

  //FirestoreHandle _firestore = FirestoreHandle();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    CollectionReference _ratings =
        FirebaseFirestore.instance.collection('ratings');
    //double _size = 40;
    if (user != null) {
      // todo: StreamBuilder instead of FutureBuilder https://firebase.flutter.dev/docs/firestore/usage/#realtime-changes
      return FutureBuilder<QuerySnapshot>(
          future: _ratings.doc('surfboards').collection(widget.surfboard).get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.done) {
              _amountRatings = snapshot.data.docs.length;
              snapshot.data.docs.forEach((doc) {
                _rating += doc['rating'];
                _averageRating = _rating / _amountRatings;
              });

              try {
                //_rating != null ? _rating = data['rating'] : _rating = 0;
                //print('_rating now is $_rating');
                //print('data is $data');
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.orange,
                          ),
                          Text(_averageRating.toStringAsFixed(2) +
                              ' (' +
                              _amountRatings.toString() +
                              ')'),
                        ],
                      ),
                    ]);
              } catch (e) {
                print(e.toString());
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        children: [
                          Text('Rating could not be loaded'),
                        ],
                      )
                    ]);
              }
            }
            if (snapshot.connectionState == ConnectionState.none) {
              return Container();
            }
            return Text('Loading');
          });
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(),
        ],
      );
    }
  }
}
