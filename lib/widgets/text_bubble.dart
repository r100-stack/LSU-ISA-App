import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

class TextBubble extends StatelessWidget {
  final String text;

  TextBubble({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultMargin / 2, vertical: kDefaultMargin / 4),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius:
              BorderRadius.all(Radius.circular(kDefaultBorderRadius))),
    );
  }
}
