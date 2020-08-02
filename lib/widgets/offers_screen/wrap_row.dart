import 'package:flutter/material.dart';
import 'package:isa_app/widgets/text_bubble.dart';

class WrapRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            TextBubble(text: '1400 sqft.'),
            TextBubble(text: 'Pets allowed'),
            TextBubble(text: 'Furnished'),
            TextBubble(text: '\$400 deopsit'),
          ],
        ),
      ],
    );
  }
}
