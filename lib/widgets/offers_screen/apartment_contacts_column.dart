import 'package:flutter/material.dart';
import 'package:isa_app/widgets/offers_screen/apartments_contacts_card.dart';

class ApartmentContactsColumn extends StatelessWidget {
  final String phoneNumber;
  final String address;
  final String website;

  final Color textColor;

  ApartmentContactsColumn(
      {this.phoneNumber, this.address, this.website, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ApartmentContactsCard(
            textColor: textColor,
            leading: Icons.phone ?? '-',
            title: phoneNumber,
            url: Uri(scheme: 'tel', path: phoneNumber).toString()),
        ApartmentContactsCard(
          textColor: textColor,
          leading: Icons.place,
          title: address,
          url: 'https://www.google.com/maps/search/${address}',
        ),
        ApartmentContactsCard(
          textColor: textColor,
          leading: Icons.public,
          title: website,
          url: website,
        ),
      ],
    );
  }
}
