import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:isa_app/models/user_1.dart';

class AuthBloc extends ChangeNotifier {
  User1 _currentUser = User1(name: 'Anonymous');

  User1 get currentUser => _currentUser;

  void modifyCurrentUser(User1 currentUser) {
    _currentUser = currentUser;
    notifyListeners();
  }

  void modifyUserName(String name) {
    _currentUser.name = name;
    notifyListeners();
  }

  void signInAnomously(BuildContext context) async {
    // FirebaseAuth _auth = FirebaseAuth.instance;
    // AuthResult authResult = await _auth.signInAnonymously();
    // FirebaseUser user = authResult.user;
    // User1 user1 = User1(uid: user.uid, isAnonymous: true);
    // _currentUser = user1;

    // notifyListeners();
    // print(user.uid);
  }
}