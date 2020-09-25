import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:isa_app/models/user_1.dart';

class AuthBloc extends ChangeNotifier {
  User1 _currentUser;

  User1 get currentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore _firestore = Firestore.instance;

  void modifyCurrentUser(User1 currentUser) {
    _currentUser = currentUser;
    notifyListeners();
  }

  // void modifyUserName(String name) {
  //   _currentUser.name = name;
  //   notifyListeners();
  // }

  void signInAnomously() async {
    if (_currentUser != null) {
      return;
    }

    AuthResult authResult = await _auth.signInAnonymously();
    FirebaseUser user = authResult.user;



    User1 user1 = User1(uid: user.uid, isAnonymous: true);
    _currentUser = user1;

    DocumentSnapshot d = await _firestore.collection('users_isa_1').document(user.uid).get();
    if (d.data != null) {
      _currentUser = User1(uid: d.documentID, name: d['name']);
    } else {
      _firestore.collection('users_isa_1').document(user.uid).setData({'name': _currentUser?.name});
    }

    notifyListeners();
  }

  void modifyUserName(String name) async {
    _currentUser.name = name;

    DocumentSnapshot d = await _firestore.collection('users_isa_1').document(_currentUser.uid).get();
    if (d != null) {
      _firestore.collection('users_isa_1').document(_currentUser.uid).updateData({'name': _currentUser?.name});
    } else {
      _firestore.collection('users_isa_1').document(_currentUser.uid).setData({'name': _currentUser?.name});
    }

    notifyListeners();
  }
}