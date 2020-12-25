import 'package:flutter/material.dart';
import 'package:isa_app/screens/airbnbs_screen/airbnbs_screen.dart';
import 'package:isa_app/screens/apartments_screen/apartments_screen.dart';
import 'package:isa_app/screens/events_screen/events_screen.dart';
import 'package:isa_app/screens/hotels_screen/hotels_screen.dart';
import 'package:isa_app/screens/officers_screen/officers_screen.dart';

class CorrectScreenBloc extends ChangeNotifier {
  List<dynamic> pages = [
    {
      'pageName': 'Apartments',
      'pageWidget': ApartmentsScreen(),
    },
    {
      'pageName': 'Hotels near LSU',
      'pageWidget': HotelsScreen(),
    },
    {
      'pageName': 'Airbnbs',
      'pageWidget': AirbnbsScreen(),
    },
    {
      'pageName': 'Committee Members',
      'pageWidget': OfficersScreen(),
    },
    {
      'pageName': 'Events',
      'pageWidget': EventsScreen(),
    },
  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
}
