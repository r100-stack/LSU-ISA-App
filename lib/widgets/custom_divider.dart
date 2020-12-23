import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultMargin / 2),
      child: Container(
        width: 20,
        height: 5,
        color: Theme.of(context).accentColor,
      ),
    );
  }
}
