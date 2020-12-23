import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/widgets/icon_number.dart';

class BedBathRow extends StatelessWidget {
  final List<double> numBeds;
  final List<double> numBaths;

  BedBathRow({this.numBeds, this.numBaths});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconNumber(
          icon: Icons.king_bed_outlined,
          numbers: numBeds,
        ),
        SizedBox(
          width: kDefaultMargin / 2,
        ),
        IconNumber(
          icon: Icons.bathtub_outlined,
          numbers: numBaths,
        )
      ],
    );
  }
}