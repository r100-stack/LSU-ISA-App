import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:isa_app/blocs/apartment_bloc.dart';
import 'package:isa_app/blocs/hotels_bloc.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/models/hotel.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/utils/offer_utils.dart';
import 'package:provider/provider.dart';

class Networking {
  static Firestore _firestore = Firestore.instance;

  static void downloadApartmentsAndOffersOnce(BuildContext context) async {
    bool isDownloadedOnce =
        Provider.of<ApartmentBloc>(context).isDownloadedOnce;

    if (!isDownloadedOnce) {
      Provider.of<ApartmentBloc>(context, listen: false).downloadedOnce();
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
          id: apartmentFirebase.documentID,
          name: apartmentFirebase['name'],
          email: apartmentFirebase['email'],
          phoneNumber: apartmentFirebase['phoneNumber'],
          address: apartmentFirebase['address'],
          website: apartmentFirebase['website'],
          imageUrl: apartmentFirebase['imageUrl']);
    }

    Provider.of<ApartmentBloc>(context, listen: false)
        .swapApartments(apartmentsMap);
  }

  static Future<void> _downloadOffers(BuildContext context) async {
    QuerySnapshot snapshot =
        await _firestore.collection('offers').getDocuments();
    List<Offer> offers = OfferUtils.getOffers(snapshot.documents);

    Map<String, Apartment> apartmentsMap =
        Provider.of<ApartmentBloc>(context, listen: false).apartmentsMap;
    for (Offer offer in offers) {
      Apartment apartment = apartmentsMap[offer.apartmentId];
      if (apartment != null) {
        apartment.offers.add(offer);
        OfferUtils.setApartmentOfferParameters(offer, apartment);
      } else {
        print('APARTMENT IS NULL! ID = ${offer.apartmentId}');
      }
    }

    Provider.of<ApartmentBloc>(context, listen: false).swapOffers(offers);
  }

  static void downloadHotelsOnce(BuildContext context) async {
    bool isDownloadedOnce = Provider.of<HotelBloc>(context).isDownloadedOnce;

    if (!isDownloadedOnce) {
      Provider.of<HotelBloc>(context, listen: false).downloadedOnce();
      _downloadHotels(context);
    }
  }

  static void _downloadHotels(BuildContext context) async {
    print('here');
    QuerySnapshot snapshot =
        await _firestore.collection('hotels').getDocuments();
    List<Hotel> hotels = [];
    for (var hotelFirebase in snapshot.documents) {
      hotels.add(Hotel(
          address: hotelFirebase['address'],
          cost: double.parse(hotelFirebase['cost'].toString()),
          distanceFromLsu: hotelFirebase['distanceFromLsu'],
          name: hotelFirebase['name'],
          phoneNumber: hotelFirebase['phoneNumber'],
          website: hotelFirebase['website']));
    }

    print(hotels.length);
    Provider.of<HotelBloc>(context, listen: false).swapHotels(hotels);
  }
}
