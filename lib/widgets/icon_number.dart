import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

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
        SizedBox(width: kDefaultMargin/8,),
        Text(text, style: Theme.of(context).textTheme.subtitle1,),
      ],
    );
  }

  String _getText(double number) {
    return number != null ? number.floor().toString() : '';
  }
}
