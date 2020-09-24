import 'package:flutter/material.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/widgets/bed_bath.dart';
import 'package:isa_app/widgets/custom_back_button.dart';
import 'package:isa_app/constants.dart';

import 'widgets/apartment_contacts_column.dart';
import 'widgets/image_title.dart';
import 'widgets/offer_card.dart';

class OffersScreen extends StatelessWidget {
  static final String routeName = '/offers';
  final Apartment apartment;

  OffersScreen(this.apartment);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: kAccentColorLight,
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.white,
                  constraints: BoxConstraints(maxWidth: kDefaultMaxWidth),
                  child: Column(
                    children: [
                      ImageAndTitle(
                        size: size,
                        imageUrl: apartment.imageUrl,
                        title: apartment.name,
                        heroId: apartment.id,
                      ),
                      BedBathRow(
                        numBeds: [apartment.minBeds, apartment.maxBeds],
                        numBaths: [apartment.minBaths, apartment.maxBaths],
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
                      ),
                      Container(
                        margin: kCardMargin,
                        padding: kCardPadding,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(kDefaultBorderRadius),
                          ),
                        ),
                        child: ApartmentContactsColumn(
                          phoneNumber: apartment.phoneNumber,
                          address: apartment.address,
                          website: apartment.website,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return OfferCard(apartment.offers[index]);
                        },
                        itemCount: apartment.offers.length,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomBackButton()
        ],
      ),
    );

    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Expanded(
    //         flex: 4,
    //         child: Container(
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.only(
    //                   bottomLeft: Radius.circular(kDefaultBorderRadius),
    //                   bottomRight: Radius.circular(kDefaultBorderRadius)),
    //               color: kAccentColorLight,
    //             ),
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.only(
    //                   bottomLeft: Radius.circular(kDefaultBorderRadius),
    //                   bottomRight: Radius.circular(kDefaultBorderRadius)),
    //               child: Padding(
    //                 padding: EdgeInsets.all(kDefaultMargin / 2),
    //                 child: CustomImage(apartment.imageUrl),
    //               ),
    //             )),
    //       ),
    //       Expanded(
    //         flex: 6,
    //         child: ListView.builder(
    //           itemBuilder: (context, index) {
    //             return OfferCard(apartment.offers[index]);
    //           },
    //           itemCount: apartment.offers.length,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
