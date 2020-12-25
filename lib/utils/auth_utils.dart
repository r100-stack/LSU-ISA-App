import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:isa_app/utils/alert_utils.dart';

enum AUTH_STATUS { NOT_LOGGED_IN, LOGGED_IN_ANONYMOUS, LOGGED_IN_EMAIL }

class AuthUtils {
  static AUTH_STATUS getAuthStatus(User1 user) {
    if (user == null) {
      return AUTH_STATUS.NOT_LOGGED_IN;
    } else if (user.isAnonymous) {
      return AUTH_STATUS.LOGGED_IN_ANONYMOUS;
    } else {
      return AUTH_STATUS.LOGGED_IN_EMAIL; // Assuming Name can never be empty.
    }
  }

  static String getDisplayUserName(User1 user) {
    AUTH_STATUS authStatus = getAuthStatus(user);
    switch (authStatus) {
      case AUTH_STATUS.NOT_LOGGED_IN:
        return 'Not signed in';
      case AUTH_STATUS.LOGGED_IN_ANONYMOUS:
        return 'Anonymous';
      case AUTH_STATUS.LOGGED_IN_EMAIL:
        return user.name; // Assuming Name can never be empty.
      default:
        return '-';
    }
  }

  static String getDisplayUserSubtitle(User1 user) {
    AUTH_STATUS authStatus = getAuthStatus(user);
    switch (authStatus) {
      case AUTH_STATUS.NOT_LOGGED_IN:
        return 'Click to sign in';
      case AUTH_STATUS.LOGGED_IN_ANONYMOUS:
        return '';
      case AUTH_STATUS.LOGGED_IN_EMAIL:
        return user.email; // Assuming Name can never be empty.
      default:
        return '';
    }
  }

  static void showSignInAlert(BuildContext context) {
    String title = 'Authentication';
    String message = 'You can register, sign in, or sign in anonymously (limited access)';
    AlertUtils.showAlert(context, title, message, [
      TextButton(child: Text('Sign-in'), onPressed: () => print('PRESSED'),),
      TextButton(child: Text('Sign-in anonymously'), onPressed: () => print('PRESSED'),),
      TextButton(child: Text('Register'), onPressed: () => print('PRESSED'),),
    ]);
    // TODO: Each button should take to the correct screen. Screens yet to be implemented.
  }
}
