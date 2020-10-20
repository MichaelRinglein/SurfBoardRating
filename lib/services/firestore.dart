import 'package:cloud_firestore/cloud_firestore.dart';
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
}