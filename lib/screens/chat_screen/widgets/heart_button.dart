import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isFilled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isFilled = !isFilled),
      child: Icon(
        isFilled ? Icons.favorite : Icons.favorite_border,
        size: 20.0,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
