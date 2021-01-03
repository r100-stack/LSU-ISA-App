import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  static final String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kRoipilPrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Image(
                image: AssetImage('assets/images/roipil_logo_text.png'),
                height: 300.0,
              ),
            ),
            // Text('Sign in')
            // Text(
            //   'ROIPIL',
            //   style: GoogleFonts.openSans(
            //       fontStyle: FontStyle.italic,
            //       fontWeight: FontWeight.w800,
            //       letterSpacing: .1),
            // ),
          ],
        ),
      ),
    );
  }
}
