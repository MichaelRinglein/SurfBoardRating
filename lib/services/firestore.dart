import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreHandle {

  CollectionReference _ratings = FirebaseFirestore.instance.collection('ratings');

  Future<void> addRating(String user, int rating, String surfboard) {
    return _ratings
        .doc(surfboard)
        .collection(user)
        .doc('rating')
        .set({
          'user': user,
          'rating': rating,
          'surfboard': surfboard
        })
        .then((value) => print('Rating added: $user rated $surfboard with $rating stars in $_ratings'))
        .catchError((error) => print('Failed to add rating: $error'));
  }

  Future<void> getRating(String user, String surfboard) {
    return _ratings
        .doc(surfboard)
        .collection(user)
        .doc('rating')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            print('Document data: ${documentSnapshot.data()}');
          } else {
            print('Document does not exist on the database');
          }
    });
  }


}