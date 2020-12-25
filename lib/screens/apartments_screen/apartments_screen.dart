import 'package:flutter/material.dart';
import 'package:isa_app/screens/apartments_screen/widgets/apartments_stream_builder.dart';
import 'package:isa_app/services/networking.dart';

// TODO: Some apartment images are removed and hence giving errors. May need to take dynamically from Google Places API. Or download and display local or Firebase bucket copies.

class ApartmentsScreen extends StatelessWidget {
  static final String routeName = '/apartments';

  @override
  Widget build(BuildContext context) {
    Networking.downloadApartmentsAndOffersOnce(context);

    return ApartmentsStreamBuilder();
  }
}
