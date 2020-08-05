import 'package:flutter/material.dart';
import 'package:isa_app/blocs/airbnb_bloc.dart';
import 'package:isa_app/models/airbnb.dart';
import 'package:isa_app/services/networking.dart';
import 'package:isa_app/widgets/airbnbs_screen/airbnb_card.dart';
import 'package:provider/provider.dart';

class AirbnbsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Networking.downloadAirbnbsOnce(context);

    List<Airbnb> airbnbs = Provider.of<AirbnbBloc>(context).airbnbs;

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
    for (Airbnb airbnb in airbnbs) {
      hotelCards.add(Container(width: 600, child: AirbnbCard(airbnb)));
    }

    return SingleChildScrollView(
      child: Wrap(
        children: hotelCards,
        direction: Axis.horizontal,
      ),
    );
  }
}
