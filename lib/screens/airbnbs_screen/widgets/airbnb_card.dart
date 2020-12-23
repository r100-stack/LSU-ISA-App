import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/airbnb.dart';
import 'package:isa_app/screens/offers_screen/widgets/apartments_contacts_card.dart';
import 'package:isa_app/widgets/custom_card.dart';

class AirbnbCard extends StatelessWidget {
  final Airbnb airbnb;

  AirbnbCard(this.airbnb);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 45,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: kDefaultMargin / 2,
                      horizontal: kDefaultMargin / 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(kDefaultBorderRadius),
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Cost per night',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Theme.of(context).primaryColor)),
                      Text('\$${airbnb.cost ?? ' -'}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Theme.of(context).primaryColor)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 55,
                child: Text(
                  airbnb.name ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          ExpandablePanel(
            header: Text(
              '',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            expanded: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultBorderRadius),
                  ),
                  color: kAccentColorLight),
              child: ApartmentContactsCard(
                textColor: Theme.of(context).primaryColor,
                title: airbnb.website,
                leading: Icons.public,
                url: airbnb.website,
              ),
            ),
          )
        ],
      ),
    );
  }
}
