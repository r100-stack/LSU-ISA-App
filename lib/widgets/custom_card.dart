import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;

  CustomCard({this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kCardPadding,
      margin: kCardMargin,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kDefaultBorderRadius),
        ),
        boxShadow: kPrimaryBoxShadow
      ),
      child: child,
    );
  }
}
