import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/models/offer.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageAndTitle(
              size: size,
              imageUrl: apartment.imageUrl,
              title: apartment.name,
              heroId: apartment.id,
            )
          ],
        ),
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
