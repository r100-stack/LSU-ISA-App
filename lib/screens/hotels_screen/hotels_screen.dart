import 'package:flutter/material.dart';
import 'package:isa_app/blocs/hotels_bloc.dart';
import 'package:isa_app/models/hotel.dart';
import 'package:isa_app/services/networking.dart';
import 'package:provider/provider.dart';

import 'widgets/hotel_card.dart';

class HotelsScreen extends StatelessWidget {
  static final String routeName = '/hotels';

  @override
  Widget build(BuildContext context) {
    Networking.downloadHotelsOnce(context);

    List<Hotel> hotels = Provider.of<HotelBloc>(context).hotels;

    double width = MediaQuery.of(context).size.width;

    // return Container(
    //   width: width,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Container(
    //         constraints: BoxConstraints(maxWidth: 600),
    //         child: ListView.builder(
    //           padding: EdgeInsets.symmetric(horizontal: width > 600 ? 20 : 0),
    //           itemBuilder: (context, index) {
    //             return HotelCard(hotels[index]);
    //           },
    //           itemCount: hotels.length,
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    List<Widget> hotelCards = [];
    for (Hotel hotel in hotels) {
      hotelCards.add(Container(width: 600, child: HotelCard(hotel)));
    }

    return SingleChildScrollView(
      child: Wrap(
        children: hotelCards,
        direction: Axis.horizontal,
      ),
    );
  }
}
