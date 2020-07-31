import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:isa_app/blocs/apartment_bloc.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/utils/offer_utils.dart';
import 'package:provider/provider.dart';

class Networking {
  static Firestore _firestore = Firestore.instance;
  static bool isDownloadedOnce = false;

  static void downloadApartmentsAndOffersOnce(BuildContext context) async {
    if (!isDownloadedOnce) {
      isDownloadedOnce = true;
      await downloadApartments(context);
      await _downloadOffers(context);
    }
  }

  static Future<void> downloadApartments(BuildContext context) async {
    QuerySnapshot snapshot =
        await _firestore.collection('apartments').getDocuments();

    Map<String, Apartment> apartmentsMap = {};
    for (var apartmentFirebase in snapshot.documents) {
      apartmentsMap[apartmentFirebase.documentID] = Apartment(
        name: apartmentFirebase['name'],
        email: apartmentFirebase['email'],
        phoneNumber: apartmentFirebase['phoneNumber'],
        website: apartmentFirebase['website'],
      );
    }

    Provider.of<ApartmentBloc>(context, listen: false)
        .swapApartments(apartmentsMap);

    print('!!!' + Provider.of<ApartmentBloc>(context, listen: false).apartmentsMap.toString());
  }

  static Future<void> _downloadOffers(BuildContext context) async {
    QuerySnapshot snapshot =
        await _firestore.collection('offers').getDocuments();
    List<Offer> offers = OfferUtils.getOffers(snapshot.documents);

    Map<String, Apartment> apartmentsMap =
        Provider.of<ApartmentBloc>(context, listen: false).apartmentsMap;
    print(offers);
    for (Offer offer in offers) {
      Apartment apartment = apartmentsMap[offer.apartmentId];
      if (apartment != null) {
        OfferUtils.setApartmentOfferParameters(offer, apartment);
      } else {
        print('APARTMENT IS NULL! ID = ${offer.apartmentId}');
      }
    }

    Provider.of<ApartmentBloc>(context, listen: false).swapOffers(offers);
    Provider.of<ApartmentBloc>(context, listen: false)
        .swapApartments(apartmentsMap);

    print('!!!' + Provider.of<ApartmentBloc>(context, listen: false).apartmentsMap.toString());
  }
}
