import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHandle {
  CollectionReference _ratings =
      FirebaseFirestore.instance.collection('ratings');

  Future<void> addRatingOfUser(String user, int rating, String surfboard) {
    //getRatingOfSurfboard(surfboard);
    return _ratings
        .doc('surfboards')
        .collection(surfboard)
        .doc(user)
        .set({'rating': rating})
        .then((value) =>
            print('addRatingOfUser: $user rated $surfboard with $rating stars'))
        .catchError((e) => print('addRatingOfUse failed: $e'));
  }

  Future<void> getRatingOfSurfboard(String surfboard) {
    //int amountRatings;

    return _ratings
        .doc('surfboards')
        .collection(surfboard)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print("$doc has rating:");
        print(doc["rating"]);
      });
      int amountReviews = querySnapshot.docs.length;
      print('there are $amountReviews ratings for this board');
    }).catchError((e) => print('getRatingOfBoard failed: $e'));
  }

/*
      .then((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> data = documentSnapshot.data();
      print('data is $data');
      int dataLength = data.length;
      print('data.length = $dataLength');
      print('Document exists on the database');

      return _surfboards
          .doc(surfboard)
          .update({
            'ratingsSum': rating,
            'ratingsAmount': dataLength,
          })
          .then((value) => print(
              'addRatingToSurfboard: $user rated $surfboard with $rating stars'))
          .catchError((e) => print('addRatingOfUse failed: $e'));
    });
    */

}
