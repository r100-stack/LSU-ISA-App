import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/screens/offers_screen.dart';
import 'package:isa_app/widgets/bed_bath.dart';
import 'package:isa_app/widgets/text_bubble.dart';

class ApartmentCard extends StatelessWidget {
  final Apartment apartment;

  ApartmentCard(this.apartment);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OffersScreen.routeName,
            arguments: apartment);
      },
      child: Container(
        margin: kCardMargin,
        padding: kCardPadding,
        decoration: BoxDecoration(
            boxShadow: kPrimaryBoxShadow,
            borderRadius:
                BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
            color: Colors.white),
        child: Row(
          children: [
            ClipRRect(
              child: Image(
                image: NetworkImage(apartment.imageUrl ?? ''),
                width: 100,
                fit: BoxFit.cover,
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(kDefaultBorderRadius)),
            ),
            SizedBox(
              width: kDefaultMargin / 2,
            ),
            Expanded(
              child: Column(
                children: [
                  BedBathRow(
                      numBeds: [apartment.minBeds, apartment.maxBeds],
                      numBaths: [apartment.minBaths, apartment.maxBaths],
                    ),
                  SizedBox(
                    height: kDefaultMargin,
                  ),
                  Text(
                    apartment.name.toUpperCase(),
                    style: Theme.of(context).textTheme.headline5,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: kDefaultMargin / 2),
                    child: Container(
                      width: 20,
                      height: 5,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Text(
                    '\$400 - \$645',
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '1200 sqft - 1400 sqft',
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
