import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
            // boxShadow: width > kDefaultMaxWidth ? kBackButtonShadow : [],
            boxShadow: kBackButtonShadow
          ),
          child: BackButton(color: Theme.of(context).accentColor)),
    );
  }
}
