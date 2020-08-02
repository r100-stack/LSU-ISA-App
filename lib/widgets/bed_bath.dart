import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/widgets/icon_number.dart';

class BedBathRow extends StatelessWidget {
  final Offer offer;

  BedBathRow({this.offer});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconNumber(
          icon: Icons.king_bed_outlined,
          number: offer.numBeds,
        ),
        SizedBox(
          width: kDefaultMargin / 2,
        ),
        IconNumber(
          icon: Icons.bathtub_outlined,
          number: offer.numBaths,
        )
      ],
    );
  }
}