import 'package:flutter/material.dart';
import 'package:isa_app/models/apartment.dart';

class ApartmentBloc extends ChangeNotifier {
  Map<String, Apartment> _apartmentsMap = {};

  Map<String, Apartment> getApartmentsMap() {
    return _apartmentsMap;
  }

  void swapApartments(Map<String, Apartment> apartmentsMap) {
    _apartmentsMap = apartmentsMap;
    notifyListeners();
  }

  void addApartment(Apartment apartment) {
    _apartmentsMap[apartment.id] = apartment;
    notifyListeners();
  }
}
