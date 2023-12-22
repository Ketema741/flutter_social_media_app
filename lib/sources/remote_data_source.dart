import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/* 
  This database stores posts that users have published in the app.
  It is stored in a collection called 'Posts' in firebase

  Each post contains:
  - a message
  - email of user
  - timestamp

*/

class RemoteDataSources {
  // curren legged in user
  User? user = FirebaseAuth.instance.currentUser;

  // get collection of posts from firebase
  final CollectionReference posts =
      FirebaseFirestore.instance.collection("Posts");

  // post message
  Future<void> addPost(String message) {
    return posts.add({
      "UserEmail": user!.email,
      "PostMessage": message,
      "TimeStamp": Timestamp.now(),
    });
  }

  // read posts from database
  Stream<QuerySnapshot> getPostsStream() {
    final postStream = FirebaseFirestore.instance
        .collection("Posts")
        .orderBy("TimeStamp", descending: true)
        .snapshots();

    return postStream;
  }
}
