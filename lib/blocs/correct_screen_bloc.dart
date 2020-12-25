import 'package:flutter/material.dart';
import 'package:isa_app/models/page_def.dart';
import 'package:isa_app/screens/airbnbs_screen/airbnbs_screen.dart';
import 'package:isa_app/screens/apartments_screen/apartments_screen.dart';
import 'package:isa_app/screens/events_screen/events_screen.dart';
import 'package:isa_app/screens/hotels_screen/hotels_screen.dart';
import 'package:isa_app/screens/officers_screen/officers_screen.dart';

class CorrectScreenBloc extends ChangeNotifier {
  List<PageDef> pages = [
    PageDef(name: 'Apartments', widget: ApartmentsScreen()),
    PageDef(name: 'Hotels near LSU', widget: HotelsScreen()),
    PageDef(name: 'Airbnbs', widget: AirbnbsScreen()),
    PageDef(name: 'Committee Members', widget: OfficersScreen()),
    PageDef(name: 'Events', widget: EventsScreen()),
  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
