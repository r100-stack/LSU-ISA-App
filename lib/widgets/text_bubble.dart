import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/offer.dart';

class TextBubble extends StatelessWidget {
  final String text;
  final AvailabilityType availabilityType;

  TextBubble({this.text, this.availabilityType});

  @override
  Widget build(BuildContext context) {
    Map<AvailabilityType, Color> backgroundColorMap = {
      null: Theme.of(context).accentColor,
      AvailabilityType.AVAILABLE_NOW: Colors.green,
      AvailabilityType.AVAILABLE_SOON: Colors.lightBlue,
      AvailabilityType.NOT_AVAILABLE: Colors.grey
    };

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultMargin / 4, vertical: kDefaultMargin / 4),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultMargin / 2, vertical: kDefaultMargin / 4),
      child: Text(
        text,
        style: TextStyle(
            color: availabilityType == null ? Colors.black87 : Colors.white),
      ),
      decoration: BoxDecoration(
          color: backgroundColorMap[availabilityType],
          borderRadius: BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
          boxShadow: kSecondaryBoxShadow),
    );
  }
}
