import 'package:cloud_firestore/cloud_firestore.dart';

class User1 {
  String uid;
  bool isAnonymous;
  String name;
  String email;

  User1({this.uid, this.isAnonymous, this.name, this.email});

  factory User1.fromDocumentSnapshot(DocumentSnapshot user1Firebase) {
    return User1(
      uid: user1Firebase.data()['uid'],
      name: user1Firebase.data()['name'],
    );
  }
}
