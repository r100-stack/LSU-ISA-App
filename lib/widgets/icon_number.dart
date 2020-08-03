import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

class IconNumber extends StatelessWidget {
  final IconData icon;
  final List<double> numbers;

  IconNumber({this.icon, this.numbers});

  @override
  Widget build(BuildContext context) {
    String text;
    if (numbers == null) {
      text = '';
    } else if (numbers.length == 1) {
      text = _getText(numbers[0]);
    } else {
      text = '${_getText(numbers[0])} - ${_getText(numbers[1])}';
    }

    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blueGrey,
        ),
        SizedBox(
          width: kDefaultMargin / 8,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }

  String _getText(double number) {
    if (number == null) {
      return '';
    }

    String text = number.floor().toString();
    double remainder = number.remainder(1);
    if (remainder == .5) {
      text += '½';
    } else if (remainder != 0) {
      text += number.remainder(1).toString();
    }

    return text;
  }
}
