import 'package:flutter/material.dart';

class IconNumber extends StatelessWidget {
  final IconData icon;
  final double number;

  IconNumber({this.icon, this.number});

  @override
  Widget build(BuildContext context) {
    String text = _getText(number);

    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blueGrey,
        ),
        Text(text),
      ],
    );
  }

  String _getText(double number) {
    if (number == null) {
      return '';
    } else {
      return number.floor().toString();
    }
  }
}
