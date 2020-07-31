import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/utils/offer_utils.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';
import 'package:isa_app/widgets/offers_screen/offer_card.dart';

class OffersStreamBuilder extends StatelessWidget {
  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('offers').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CustomProgressIndicator();
        }

        final offersFirebase = snapshot.data.documents;
        final List<Offer> offers = OfferUtils.getOffers(offersFirebase);
        return ListView.builder(
          itemBuilder: (context, index) {
            return OfferCard(offers[index]);
          },
          itemCount: offers.length,
        );
      },
    );
  }
}
