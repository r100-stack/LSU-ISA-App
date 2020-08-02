import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/apartment.dart';
import 'package:isa_app/screens/offers_screen.dart';

class ApartmentCard extends StatelessWidget {
  final Apartment apartment;

  ApartmentCard(this.apartment);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OffersScreen.routeName, arguments: apartment.imageUrl);
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(apartment.imageUrl), fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultMargin / 2, vertical: kDefaultMargin),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.bathtub_outlined,
                            color: Colors.blueGrey,
                          ),
                          Text('${(apartment.minBeds)} - ${(apartment.minBeds)}'),
                          SizedBox(
                            width: kDefaultMargin / 2,
                          ),
                          Icon(
                            Icons.bathtub_outlined,
                            color: Colors.blueGrey,
                          ),
                          Text('${apartment.minBaths} - ${apartment.maxBaths}')
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultMargin / 2,
                            vertical: kDefaultMargin / 4),
                        child: Text(
                          'AVAILABLE',
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultBorderRadius))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: kDefaultMargin,
                  ),
                  Text(
                    apartment.name.toUpperCase(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: kDefaultMargin / 2),
                    child: Container(
                      width: 20,
                      height: 5,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Text(
                    '\$400 - \$645',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '1200 sqft - 1400 sqft',
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
