import 'package:flutter/cupertino.dart';
import 'package:isa_app/models/event.dart';

class EventBloc extends ChangeNotifier {
  List<Event> _events = [];
  bool isDownloadedOnce = false;

  List<Event> get events => _events;

  void swapEvents(List<Event> events) {
    _events = events;
    notifyListeners();
  }

  void downloadedOnce() {
    isDownloadedOnce = true;
  }
}