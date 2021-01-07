// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:flutter/material.dart';
// import 'package:isa_app/constants.dart';
// import 'package:isa_app/models/user_1.dart';
// import 'package:isa_app/utils/alert_utils.dart';
// import 'package:roipil_authentication/roipil_authentication.dart';

// class AuthBloc extends ChangeNotifier {
//   User1 _currentUser;
//   String _trial = 'a';

//   User1 get currentUser => _currentUser;
//   String get trial => _trial;

//   // auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
//   // FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   StreamSubscription authStreamSubscription;

//   void updateUser(User1 user) {
//     _currentUser = user;
//     // _trial = trial + '2';
//     print('updateUser called: ${_currentUser?.name}');
//     notifyListeners();
//   }

//   void updateTrial(String trial) {
//     _trial = trial;
//     print('updateTrial called: $_trial');
//     notifyListeners();
//   }

//   Future<void> initializeRoipilAuthentication() async {
//     // await RoipilAuthentication.initialize((auth.User user) {
//     //   User1 customUser;

//     //   if (user != null && authStreamSubscription == null) {
//     //     authStreamSubscription = kUsersRef
//     //         .doc(user.uid)
//     //         .snapshots()
//     //         .listen((DocumentSnapshot snapshot) {
//     //       customUser = User1.fromDocumentSnapshotAndFirebaseUser(user, snapshot);
//     //       print('S-: ${_currentUser?.name}');
//     //       print('S: ${customUser.name}');
//     //       updateUser(customUser);
//     //       notifyListeners();
//     //       updateTrial(_trial + '2');
//     //       print('S*: ${_currentUser.name}');
//     //     });

//     //     print('Signed in: ${user.email}');
//     //     print('E: ${_currentUser?.name}');
//     //     // BotToast.showSimpleNotification(title: "Signed in as ${_user.name}");
//     //   } else {
//     //     authStreamSubscription?.cancel();
//     //     updateUser(null);
//     //     print('NO');
//     //     // BotToast.showSimpleNotification(title: "Signed out");
//     //   }
//     // });
//   }

//   void signInWithEmailPassword(
//       BuildContext context, String email, String password) async {
//     // try {
//     //   auth.UserCredential credential = await _auth.signInWithEmailAndPassword(
//     //       email: email, password: password);
//     //   auth.User user = credential.user;

//     //   _user =
//     //       User1(uid: user.uid, isAnonymous: false, email: user.email);
//     //   notifyListeners();
//     // } catch (e) {
//     //   // TODO: For robustness, e must be of type FirebaseAuthException
//     //   AlertUtils.showAlert(context, 'Error', e.message, [
//     //     TextButton(
//     //       child: Text('OK'),
//     //       onPressed: () => Navigator.pop(context),
//     //     )
//     //   ]);
//     // }
//   }

//   // TODO: Deprecate old methods
//   void modifyCurrentUser(User1 currentUser) {
//     // _user = currentUser;
//     // notifyListeners();
//   }

//   // void modifyUserName(String name) {
//   //   _currentUser.name = name;
//   //   notifyListeners();
//   // }

//   void signInAnomously() async {
//     // if (_user != null) {
//     //   return;
//     // }

//     // auth.UserCredential credential = await _auth.signInAnonymously();
//     // auth.User user = credential.user;

//     // User1 user1 = User1(uid: user.uid, isAnonymous: true);
//     // _user = user1;

//     // DocumentSnapshot d =
//     //     await _firestore.collection('users_isa_1').doc(user.uid).get();
//     // if (d.data() != null) {
//     //   _user = User1(uid: d.id, name: d.data()['name']);
//     // } else {
//     //   _firestore
//     //       .collection('users_isa_1')
//     //       .doc(user.uid)
//     //       .set({'name': _user?.name});
//     // }

//     // notifyListeners();
//   }

//   void modifyUserName(String name) async {
//     // _user.name = name;

//     // DocumentSnapshot d = await _firestore
//     //     .collection('users_isa_1')
//     //     .doc(_user.uid)
//     //     .get();
//     // if (d != null) {
//     //   _firestore
//     //       .collection('users_isa_1')
//     //       .doc(_user.uid)
//     //       .update({'name': _user?.name});
//     // } else {
//     //   _firestore
//     //       .collection('users_isa_1')
//     //       .doc(_user.uid)
//     //       .set({'name': _user?.name});
//     // }

//     // notifyListeners();
//   }
// }

// // TODO: When the user signs out, we must sign in anonymously.
