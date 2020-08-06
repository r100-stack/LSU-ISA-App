import 'package:flutter/material.dart';
import 'package:isa_app/blocs/officer_bloc.dart';
import 'package:isa_app/models/officer.dart';
import 'package:isa_app/services/networking.dart';
import 'package:isa_app/widgets/officers_screen/officer_card.dart';
import 'package:provider/provider.dart';

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

    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          // constraints: BoxConstraints(maxWidth: 300),
          // width: 200,
          height: 300,
          child: OfficerCard(officers[index]),
        );
      },
      itemCount: officers.length,
    );
  }
}
