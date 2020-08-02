import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/widgets/bed_bath.dart';
import 'package:isa_app/widgets/icon_number.dart';
import 'package:isa_app/widgets/offers_screen/option_card.dart';
import 'package:isa_app/widgets/text_bubble.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  OfferCard(this.offer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BedBathRow(offer: offer),
              TextBubble(text: 'AVAILABLE',)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  OptionCard(),
                  OptionCard(),
                  OptionCard(),
                  OptionCard(),
                  OptionCard(),
                  OptionCard(),
                ],
              ),
            ],
          ),
          Column(
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
          )
        ],
      ),
    );
  }
}


