import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/apartment_bloc.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/widgets/apartments_screen/apartment_card.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';
import 'package:provider/provider.dart';

class ApartmentsStreamBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, Apartment> apartmentsMap =
        Provider.of<ApartmentBloc>(context).apartmentsMap;
    List<Apartment> apartments = apartmentsMap.values.toList();

    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = (width / 550).floor();
    crossAxisCount = crossAxisCount < 1 ? 1 : crossAxisCount;

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, childAspectRatio: 12/4),
        itemBuilder: (context, index) {
          return Container(child: ApartmentCard(apartments[index]));
        }, itemCount: apartments.length,);

    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     return ApartmentCard(apartments[index]);
    //   },
    //   itemCount: apartments.length,
    // );
  }

//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder(
//      stream: _firestore.collection('apartments').snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return CustomProgressIndicator();
//        }
//
//        final apartmentsFirebase = snapshot.data.documents;
//        Map<String, Apartment> apartmentsMap = {};
//        for (var apartmentFirebase in apartmentsFirebase) {
//          if (apartmentFirebase.documentID == 'change') {
//            continue;
//          }
//
//          Apartment apartment = Apartment(
//            name: apartmentFirebase['name'],
//            email: apartmentFirebase['email'],
//            phoneNumber: apartmentFirebase['phoneNumber'],
//            website: apartmentFirebase['website'],
//          );
//
//          apartmentsMap[apartmentFirebase.documentID] = apartment;
//        }
//
//        Provider.of<ApartmentBloc>(context).swapApartments(apartmentsMap);
//        List<Apartment> apartments = [];
//        apartmentsMap.forEach((id, apartment) {apartments.add(apartment);});
//
//        return ListView.builder(itemBuilder: (context, index) {
//          return ApartmentCard(apartments[index]);
//        }, itemCount: apartments.length,);
//      },
//    );
//  }
}
