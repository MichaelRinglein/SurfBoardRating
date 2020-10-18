import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreHandle {

  CollectionReference _ratings = FirebaseFirestore.instance.collection('ratings');

  Stream<FirestoreHandle> get _rating {
    return _rating;
    print('Rating in Stream provider is: $_rating');
  }

  Future<void> addRating(String user, int rating, String surfboard) {
    return _ratings
        .doc('users')
        .collection(user)
        .doc(surfboard)
        .set({
          'user': user,
          'rating': rating,
          'surfboard': surfboard
        })
        .then((value) => print('Rating added: $user rated $surfboard with $rating stars in $_ratings'))
        .catchError((error) => print('Failed to add rating: $error'));
  }

  Future<void> getRating(String user, String surfboard) {
    print('surfboard is: ' + surfboard);
    return _ratings
      .doc('users')
      .collection(user)
      .doc(surfboard)
      .get()
      .then((data) {
        print(data.data()['rating']);
        print(data.data()['rating'].runtimeType);
        return data.data()['rating'];
        //print(data.docs[1].data());
      });
  }

  Stream<QuerySnapshot> get ratings {
    return _ratings.snapshots();
  }
}