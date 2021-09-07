import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHandle {
  Future<void> addRating(String user, int rating, String surfboard) {
    return FirebaseFirestore.instance
        .collection(user)
        .doc(surfboard)
        .set({'user': user, 'rating': rating, 'surfboard': surfboard})
        .then((value) =>
            print('Rating added: $user rated $surfboard with $rating stars'))
        .catchError((error) => print('Failed to add rating: $error'));
  }
}
