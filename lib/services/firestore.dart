import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreHandle {

  CollectionReference _ratings = FirebaseFirestore.instance.collection('ratings');

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
    return _ratings
        .doc('users')
        .collection(user)
        .where('rating', isGreaterThan: 2)
        //.doc(surfboard)
        .get()
        .then((data) {
          print(data.docs[0].data());
          print(data.docs[1].data());
        });

/*
        .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            Map<String, dynamic> data = documentSnapshot.data();
            print('User ${data['user']} rated surfboard ${data['surfboard']} with ${data['rating']} stars');
          } else {
            print('Document does not exist on the database');
          }
    });

 */
  }


}