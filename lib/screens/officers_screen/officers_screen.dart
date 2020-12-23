import 'package:flutter/material.dart';
import 'package:isa_app/blocs/officer_bloc.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/officer.dart';
import 'package:isa_app/services/networking.dart';
import 'package:provider/provider.dart';

import 'widgets/officer_card.dart';

class OfficersScreen extends StatelessWidget {
  static final String routeName = '/officers';

  @override
  Widget build(BuildContext context) {
    Networking.downloadOfficersOnce(context);

    List<Officer> officers = Provider.of<OfficerBloc>(context).officers;
    // return GridView.builder(
    //   gridDelegate:
    //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //   itemBuilder: (context, index) {
    //     return OfficerCard(officers[index]);
    //   },
    //   itemCount: officers.length,
    // );

    List<Widget> officerCards = [];
    for (Officer officer in officers) {
      officerCards.add(Container(
        width: 350,
        height: 400,
        child: OfficerCard(officer),
      ));
    }
    return SingleChildScrollView(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: kDefaultMargin,
        runSpacing: kDefaultMargin,
        children: officerCards,
      ),
    );

    //   return ListView.builder(
    //     itemBuilder: (context, index) {
    //       return Container(
    //         // constraints: BoxConstraints(maxWidth: 300),
    //         // width: 200,
    //         height: 300,
    //         child: OfficerCard(officers[index]),
    //       );
    //     },
    //     itemCount: officers.length,
    //   );
    // }
  }
}
