import 'package:flutter/material.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/models/hotel.dart';
import 'package:isa_app/models/offer.dart';

class HotelBloc extends ChangeNotifier {
  List<Hotel> _hotels = [];
  bool isDownloadedOnce = false;

  List<Hotel> get hotels => _hotels;

  void swapHotels(List<Hotel> hotels) {
    _hotels = hotels;
    notifyListeners();
  }

  void downloadedOnce() {
    isDownloadedOnce = true;
  }
}
