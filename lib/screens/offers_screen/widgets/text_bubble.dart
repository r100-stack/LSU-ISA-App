import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/offer.dart';

class TextBubble extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  TextBubble({this.text, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultMargin / 4, vertical: kDefaultMargin / 4),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultMargin / 2, vertical: kDefaultMargin / 4),
      child: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.black),
      ),
      decoration: BoxDecoration(
          color: color ?? Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
          boxShadow: kSecondaryBoxShadow),
    );
  }
}
