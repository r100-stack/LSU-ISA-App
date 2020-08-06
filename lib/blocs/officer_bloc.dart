import 'package:flutter/material.dart';
import 'package:isa_app/models/officer.dart';

class OfficerBloc extends ChangeNotifier {
  List<Officer> _officers = [];
  bool isDownloadedOnce = false;

  List<Officer> get officers => _officers;

  void swapOfficers(List<Officer> officers) {
    _officers = officers;
    notifyListeners();
  }

  void downloadedOnce() {
    isDownloadedOnce = true;
  }
}
