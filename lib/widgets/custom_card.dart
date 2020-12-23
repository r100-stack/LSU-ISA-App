import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final List<BoxShadow> shadow;
  final Function onTap;

  CustomCard({this.child, this.color, this.margin, this.padding, this.shadow, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? kCardMargin,
      decoration: BoxDecoration(
        boxShadow: shadow ?? kPrimaryBoxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        child: Material(
          color: color ?? Colors.white,
          child: Container(
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: padding ?? kCardPadding,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
