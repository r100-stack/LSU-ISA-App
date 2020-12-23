import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/screens/offers_screen/offers_screen.dart';
import 'package:isa_app/utils/image_utils.dart';
import 'package:isa_app/widgets/bed_bath.dart';
import 'package:isa_app/widgets/custom_divider.dart';

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
                child: Hero(
                  tag: 'apartment_image${apartment.id}',
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(kDefaultBorderRadius),
                        ),
                        color: Color(0xFFFEF1BD),
                        image: DecorationImage(
                            image: ImageUtils.getApartmentImage(
                                apartment.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              SizedBox(
                width: kDefaultMargin / 4,
              ),
              Expanded(
                flex: 55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    CustomDivider(),
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
