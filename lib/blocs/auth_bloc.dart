import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:isa_app/utils/alert_utils.dart';

class AuthBloc extends ChangeNotifier {
  User1 _currentUser;

  User1 get currentUser => _currentUser;

  auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void signInWithEmailPassword(
      BuildContext context, String email, String password) async {
    try {
      auth.UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      auth.User user = credential.user;

      _currentUser =
          User1(uid: user.uid, isAnonymous: false, email: user.email);
      notifyListeners();
    } catch (e) {
      // TODO: For robustness, e must be of type FirebaseAuthException
      AlertUtils.showAlert(context, 'Error', e.message, [
        TextButton(
          child: Text('OK'),
          onPressed: () => Navigator.pop(context),
        )
      ]);
    }
  }

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

    auth.UserCredential credential = await _auth.signInAnonymously();
    auth.User user = credential.user;

    User1 user1 = User1(uid: user.uid, isAnonymous: true);
    _currentUser = user1;

    DocumentSnapshot d =
        await _firestore.collection('users_isa_1').doc(user.uid).get();
    if (d.data() != null) {
      _currentUser = User1(uid: d.id, name: d.data()['name']);
    } else {
      _firestore
          .collection('users_isa_1')
          .doc(user.uid)
          .set({'name': _currentUser?.name});
    }

    notifyListeners();
  }

  void modifyUserName(String name) async {
    _currentUser.name = name;

    DocumentSnapshot d = await _firestore
        .collection('users_isa_1')
        .doc(_currentUser.uid)
        .get();
    if (d != null) {
      _firestore
          .collection('users_isa_1')
          .doc(_currentUser.uid)
          .update({'name': _currentUser?.name});
    } else {
      _firestore
          .collection('users_isa_1')
          .doc(_currentUser.uid)
          .set({'name': _currentUser?.name});
    }

    notifyListeners();
  }
}

// TODO: When the user signs out, we must sign in anonymously.
