import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsets margin;
  final EdgeInsets padding;

  CustomCard({this.child, this.color, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? kCardPadding,
      margin: margin ?? kCardMargin,
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
