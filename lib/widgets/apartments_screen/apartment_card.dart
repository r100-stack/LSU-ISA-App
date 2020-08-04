import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/screens/offers_screen.dart';
import 'package:isa_app/widgets/bed_bath.dart';
import 'package:isa_app/widgets/custom_image.dart';
import 'package:isa_app/widgets/offers_screen/text_bubble.dart';

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
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                flex: 45,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(kDefaultBorderRadius),
                    ),
                    color: Color(0xFFFEF1BD),
                    // color: Theme.of(context).accentColor,
                  ),
                  child: ClipRRect(
                    child: CustomImage(apartment.imageUrl),
                    borderRadius: BorderRadius.all(
                      Radius.circular(kDefaultBorderRadius),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: kDefaultMargin / 4,
              ),
              Expanded(
                flex: 55,
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
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: kDefaultMargin / 2),
                      child: Container(
                        width: 20,
                        height: 5,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      '\$${apartment.minCost} - \$${apartment.maxCost}',
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${apartment.minSqft} sqft. - ${apartment.maxSqft} sqft.',
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
      ),
    );
  }
}
