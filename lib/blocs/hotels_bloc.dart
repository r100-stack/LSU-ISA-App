import 'package:flutter/material.dart';
import 'package:isa_app/models/hotel.dart';

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
