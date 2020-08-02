import 'package:isa_app/models/offer.dart';

class Apartment {
  String id;
  String name;
  String email;
  String phoneNumber;
  String website;
  String imageUrl;

  double minBeds;
  double maxBeds;
  double minBaths;
  double maxBaths;

  bool available;

  double minCost;
  double maxCost;
  double minSqft;
  double maxSqft;

  List<Offer> offers = [];

  Apartment({this.id, this.name, this.email, this.phoneNumber, this.website, this.imageUrl});
}