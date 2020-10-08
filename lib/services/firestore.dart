import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestore {
  final String user = 'Michael';
  final int rating = 4;

  //Firestore(this.user, this.rating);

  CollectionReference ratings = FirebaseFirestore.instance.collection('ratings');

  Future<void> addRating() {
    return ratings
        .add({
          'user': user,
          'rating': rating,
        })
        .then((value) => print('Rating added'))
        .catchError((error) => print('Failed to add rating: $error'));
  }

}