import 'package:flutter/material.dart';
import 'package:isa_app/screens/apartments_screen/widgets/apartments_stream_builder.dart';
import 'package:isa_app/services/networking.dart';

class ApartmentsScreen extends StatelessWidget {
  static final String routeName = '/apartments';

  @override
  Widget build(BuildContext context) {
    Networking.downloadApartmentsAndOffersOnce(context);

    return ApartmentsStreamBuilder();
  }
}
