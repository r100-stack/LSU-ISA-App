import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:logger/logger.dart';
import 'package:roipil_authentication/models/roipil_extended_user.dart';

class User1 extends RoipilExtendedUser{
  auth.User firebaseUser;
  String name;

  User1({this.firebaseUser, this.name});

  // factory User1.fromDocumentSnapshotAndFirebaseUser(auth.User firebaseUser, DocumentSnapshot snapshot) {
  //   if (firebaseUser == null || snapshot == null) {
  //     Logger().d('firebaseUser: $firebaseUser & snapshot: $snapshot');
  //     return null;
  //   }

  //   return User1(
  //     firebaseUser: firebaseUser,
  //     name: snapshot.data()['name'],
  //   );
  // }

  @override
  void updateRoipilExtendedUser(DocumentSnapshot snapshot) {
    name = snapshot.data()['name'];
  }
}
