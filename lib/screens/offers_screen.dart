import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';
import 'package:isa_app/utils/offer_utils.dart';
import 'package:isa_app/widgets/offers_screen/offers_stream_builder.dart';
import 'package:isa_app/constants.dart';

class OffersScreen extends StatelessWidget {
  static final String routeName = '/offers';
  final String apartmentId;

  OffersScreen(this.apartmentId);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height * .4,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              color: Colors.red,
              height: height * .4 - 20,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(kDefaultBorderRadius * 2),
                    bottomRight: Radius.circular(kDefaultBorderRadius * 2)),
                child: Image(
                  width: double.maxFinite,
                  image: NetworkImage(apartmentId),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
//                bottom: 0,
//                left: 0,
//                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: kDefaultMargin * 2),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                    height: 40,
                    width: width * 7,
                    child: Center(
                        child: Text(
                      'Lark Baton Rouge',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ))))
          ],
        ),
      ),
    );
  }
}
