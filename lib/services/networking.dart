import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:isa_app/blocs/airbnb_bloc.dart';
import 'package:isa_app/blocs/apartment_bloc.dart';
import 'package:isa_app/blocs/event_bloc.dart';
import 'package:isa_app/blocs/hotels_bloc.dart';
import 'package:isa_app/blocs/officer_bloc.dart';
import 'package:isa_app/models/airbnb.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/models/event.dart';
import 'package:isa_app/models/hotel.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/models/officer.dart';
import 'package:isa_app/utils/offer_utils.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static void downloadHotelsOnce(BuildContext context) {
    bool isDownloadedOnce = Provider.of<HotelBloc>(context).isDownloadedOnce;

    if (!isDownloadedOnce) {
      Provider.of<HotelBloc>(context, listen: false).downloadedOnce();
      _downloadHotels(context);
    }
  }

  static void _downloadHotels(BuildContext context) async {
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

    Provider.of<HotelBloc>(context, listen: false).swapHotels(hotels);
  }

  static void downloadAirbnbsOnce(BuildContext context) {
    bool isDownloadedOnce = Provider.of<AirbnbBloc>(context).isDownloadedOnce;

    if (!isDownloadedOnce) {
      Provider.of<AirbnbBloc>(context, listen: false).downloadedOnce();
      _downloadAirbnbs(context);
    }
  }

  static void _downloadAirbnbs(BuildContext context) async {
    QuerySnapshot snapshot =
        await _firestore.collection('airbnbs').getDocuments();
    List<Airbnb> airbnbs = [];
    for (var airbnbFirebase in snapshot.documents) {
      airbnbs.add(Airbnb(
          cost: double.parse(airbnbFirebase['cost'].toString()),
          name: airbnbFirebase['name'],
          website: airbnbFirebase['website']));
    }

    Provider.of<AirbnbBloc>(context, listen: false).swapAirbnbs(airbnbs);
  }

  static void downloadOfficersOnce(BuildContext context) {
    bool isDownloadedOnce = Provider.of<OfficerBloc>(context).isDownloadedOnce;

    if (!isDownloadedOnce) {
      Provider.of<OfficerBloc>(context, listen: false).downloadedOnce();
      _downloadOfficers(context);
    }
  }

  static void _downloadOfficers(BuildContext context) async {
    QuerySnapshot snapshot =
        await _firestore.collection('officers').getDocuments();
    List<Officer> officers = [];
    for (var officerFirebase in snapshot.documents) {
      officers.add(Officer(
          id: officerFirebase.documentID,
          level: officerFirebase['level'],
          name: officerFirebase['name'],
          position: officerFirebase['position'],
          tagline: officerFirebase['tagline'],
          description: officerFirebase['description'],
          profileImageUrl: officerFirebase['images']['profile'],
          bannerImageUrl: officerFirebase['images']['banner'],
          facebookLink: officerFirebase['links']['facebook'],
          instagramLink: officerFirebase['links']['instagram'],
          twitterLink: officerFirebase['links']['twitter'],
          linkedinLink: officerFirebase['links']['linkedin'],
          websiteLink: officerFirebase['links']['website']));
    }

    Provider.of<OfficerBloc>(context, listen: false).swapOfficers(officers);
  }

  static void downloadEventsOnce(BuildContext context) {
    bool isDownloadedOnce = Provider.of<EventBloc>(context).isDownloadedOnce;

    if (!isDownloadedOnce) {
      Provider.of<EventBloc>(context, listen: false).downloadedOnce();
      _downloadEvents(context);
    }
  }

  static void _downloadEvents(BuildContext context) async {
    QuerySnapshot snapshot =
        await _firestore.collection('events').getDocuments();
    List<Event> events = [];
    for (var eventFirebase in snapshot.documents) {
      events.add(Event(
          name: eventFirebase['name'],
          startDate: DateTime.fromMicrosecondsSinceEpoch(
              eventFirebase['startDate'].microsecondsSinceEpoch),
          endDate: DateTime.fromMicrosecondsSinceEpoch(
              eventFirebase['endDate'].microsecondsSinceEpoch),
          description: eventFirebase['description'],
          imageUrls: List.from(eventFirebase['imageUrls']),
          // location: {
          //   'type': eventFirebase['location']['type'],
          //   'link': eventFirebase['location']['link']
          // },
          imageAlbumLink: eventFirebase['imageAlbumLink']));
    }

    Provider.of<EventBloc>(context, listen: false).swapEvents(events);
  }

  static void launchUrl(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      print('Error launching the url: $url');
      Alert(context: context, title: 'Sorry, couldn\'t open that.').show();
    }
  }
}
