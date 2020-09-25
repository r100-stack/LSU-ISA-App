import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final List<BoxShadow> shadow;

  CustomCard({this.child, this.color, this.margin, this.padding, this.shadow});

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
        boxShadow: shadow ?? kPrimaryBoxShadow
      ),
      child: child,
    );
  }
}
