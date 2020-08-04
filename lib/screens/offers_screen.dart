import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/widgets/bed_bath.dart';
import 'package:isa_app/widgets/custom_image.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';
import 'package:isa_app/utils/offer_utils.dart';
import 'package:isa_app/widgets/offers_screen/image_title.dart';
import 'package:isa_app/widgets/offers_screen/offer_card.dart';
import 'package:isa_app/widgets/offers_screen/offers_stream_builder.dart';
import 'package:isa_app/constants.dart';

class OffersScreen extends StatelessWidget {
  static final String routeName = '/offers';
  final Apartment apartment;

  OffersScreen(this.apartment);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
              children: [SingleChildScrollView(
          child: Column(
            children: [
              ImageAndTitle(
                size: size,
                imageUrl: apartment.imageUrl,
                title: apartment.name,
                heroId: apartment.id,
              ),
              Hero(
                tag: 'bed_bath_row${apartment.id}',
                child: BedBathRow(
                  numBeds: [apartment.minBeds, apartment.maxBeds],
                  numBaths: [apartment.minBaths, apartment.maxBaths],
                ),
              ),
              Hero(
                tag: 'cost_range${apartment.id}',
                child: Text(
                  '\$${apartment.minCost} - \$${apartment.maxCost}',
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Hero(
                tag: 'sqft_range${apartment.id}',
                child: Text(
                  '${apartment.minSqft} sqft. - ${apartment.maxSqft} sqft.',
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
        SafeArea(
            child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      color: Color(0xFF3D3D3D).withOpacity(.2),
                      blurRadius: 10)
                ]),
                child: BackButton(color: Theme.of(context).accentColor)),
          )],
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
