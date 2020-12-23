import 'package:flutter/material.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/models/offer.dart';

class ApartmentBloc extends ChangeNotifier {
  Map<String, Apartment> _apartmentsMap = {};
  List<Offer> _offers = [];
  bool isDownloadedOnce = false;

  Map<String, Apartment> get apartmentsMap => _apartmentsMap;
  List<Offer> get offers => _offers;

  void swapApartments(Map<String, Apartment> apartmentsMap) {
    _apartmentsMap = apartmentsMap;
    notifyListeners();
  }

  void swapOffers(List<Offer> offers) {
    _offers = offers;
    notifyListeners();
  }

  void downloadedOnce() {
    isDownloadedOnce = true;
  }
}
