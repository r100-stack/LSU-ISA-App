import 'package:flutter/material.dart';
import 'package:isa_app/models/offer.dart';

import 'text_bubble.dart';

class AvailabilityTextBubble extends StatelessWidget {
  final AvailabilityType availabilityType;

  AvailabilityTextBubble({this.availabilityType});

  @override
  Widget build(BuildContext context) {
    Map<AvailabilityType, Color> backgroundColorMap = {
      null: Colors.green,
      AvailabilityType.AVAILABLE_NOW: Colors.green,
      AvailabilityType.AVAILABLE_SOON: Colors.lightBlue,
      AvailabilityType.NOT_AVAILABLE: Colors.grey
    };

    String text = 'AVAILABLE';
    switch (availabilityType) {
      case AvailabilityType.AVAILABLE_NOW:
        text = 'AVAILABLE';
        break;
      case AvailabilityType.NOT_AVAILABLE:
        text = 'NOT AVAILABLE';
        break;
      case AvailabilityType.AVAILABLE_SOON:
        text = 'AVAILABLE SOON';
        break;
    }

    return TextBubble(
        text: text,
        color: backgroundColorMap[availabilityType],
        textColor: Colors.white);
  }
}
