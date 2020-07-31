import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:isa_app/blocs/apartment_bloc.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:provider/provider.dart';

class Networking {
  static Firestore _firestore = Firestore.instance;

  static void downloadApartments(BuildContext context) async {
    QuerySnapshot snapshot =
        await _firestore.collection('apartments').getDocuments();

    Map<String, Apartment> apartmentsMap = {};
    for (var apartmentFirebase in snapshot.documents) {
      apartmentsMap[apartmentFirebase.documentID] = Apartment(
        name: apartmentFirebase['name'],
        email: apartmentFirebase['email'],
        phoneNumber: apartmentFirebase['phoneNumber'],
        website: apartmentFirebase['website'],
      );
    }

    Provider.of<ApartmentBloc>(context, listen: false).swapApartments(apartmentsMap);
  }
}
