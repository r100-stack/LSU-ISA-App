import 'package:flutter/material.dart';

class AlertUtils {
  static AlertDialog createAlertDialog(
      String title, String message, List<Widget> actions) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: actions,
    );
  }

  // TODO: Must implement for iOS version also.
  // TODO: Also must make sure using only rFlutter or AlertDialogs. ie. ALL ALERTS MUST PASS THROUGH ALERTUTILS.
  static void showAlert(BuildContext context, String title, String message,
      List<Widget> actions) {
    AlertDialog alertDialog = createAlertDialog(title, message, actions);
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => alertDialog,
    );
  }

  // static void showNonActionAlert(
  //     BuildContext context, String title, String message) {

  //   AlertDialog alertDialog = createAlertDialog(title, message, [
  //     TextButton(
  //         child: Text('OK'),
  //         onPressed: () => Navigator.pop(context),
  //       )
  //   ]);

  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (_) => alertDialog,
  //   );
  // }

  // static void showDualActionAlert(BuildContext context, String title, String message, List<Widget> actions) {
  //   AlertDialog alertDialog = createAlertDialog(title, message, actions);

  //   showDialog(context: context, barrierDismissible: )
  // }
}
