import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/hotels_bloc.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/hotel.dart';
import 'package:isa_app/services/networking.dart';
import 'package:isa_app/widgets/custom_card.dart';
import 'package:isa_app/widgets/hotels_screen/hotel_card.dart';
import 'package:isa_app/widgets/offers_screen/apartment_contacts_column.dart';
import 'package:isa_app/widgets/offers_screen/apartments_contacts_card.dart';
import 'package:provider/provider.dart';

class HotelsScreen extends StatelessWidget {
  static final String routeName = '/hotels';

  @override
  Widget build(BuildContext context) {
    Networking.downloadHotelsOnce(context);

    List<Hotel> hotels = Provider.of<HotelBloc>(context).hotels;

    return ListView.builder(
      itemBuilder: (context, index) {
        return HotelCard(hotels[index]);
      },
      itemCount: hotels.length,
    );
  }
}
