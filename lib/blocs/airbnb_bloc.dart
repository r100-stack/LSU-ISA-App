import 'package:flutter/cupertino.dart';
import 'package:isa_app/models/airbnb.dart';

class AirbnbBloc extends ChangeNotifier {
  List<Airbnb> _airbnbs = [];
  bool isDownloadedOnce = false;

  List<Airbnb> get airbnbs => _airbnbs;

  void swapAirbnbs(List<Airbnb> airbnbs) {
    _airbnbs = airbnbs;
    notifyListeners();
  }

  void downloadedOnce() {
    isDownloadedOnce = true;
  }
}
