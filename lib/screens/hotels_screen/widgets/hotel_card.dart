import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/hotel.dart';
import 'package:isa_app/screens/offers_screen/widgets/apartment_contacts_column.dart';
import 'package:isa_app/widgets/custom_card.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  HotelCard(this.hotel);

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
                      Text('From',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Theme.of(context).primaryColor)),
                      Text('\$${hotel.cost ?? ' -'}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Theme.of(context).primaryColor)),
                      SizedBox(height: kDefaultMargin / 2),
                      Text(
                        'Distance from LSU',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                      Text('${hotel.distanceFromLsu ?? '-'} mi',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              // .copyWith(color: Colors.black87),
                              .copyWith(color: Theme.of(context).primaryColor))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 55,
                child: Text(
                  hotel.name ?? '',
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
              child: ApartmentContactsColumn(
                textColor: Theme.of(context).primaryColor,
                phoneNumber: hotel.phoneNumber,
                address: hotel.address,
                website: hotel.website,
              ),
            ),
          )
        ],
      ),
    );
  }
}
