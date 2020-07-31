import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';
import 'package:isa_app/utils/offer_utils.dart';
import 'package:isa_app/widgets/offers_screen/offers_stream_builder.dart';

class OffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firestore _firestore = Firestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text('Offers'),
      ),
      body: OffersStreamBuilder(),
    );
  }
}
