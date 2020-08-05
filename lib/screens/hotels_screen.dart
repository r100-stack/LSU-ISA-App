import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/widgets/custom_card.dart';
import 'package:isa_app/widgets/offers_screen/apartment_contacts_column.dart';
import 'package:isa_app/widgets/offers_screen/apartments_contacts_card.dart';

class HotelsScreen extends StatelessWidget {
  static final String routeName = '/hotels';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
      body: Column(
        children: [
          CustomCard(
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
                                    .copyWith(
                                        color: Theme.of(context).primaryColor)),
                            Text('\$76',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: Theme.of(context).primaryColor)),
                            SizedBox(height: kDefaultMargin / 2),
                            Text(
                              'Distance from LSU',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                            Text('7.8 mi',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    // .copyWith(color: Colors.black87),
                                    .copyWith(
                                        color: Theme.of(context).primaryColor))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 55,
                      child: Text(
                        'Oyo Hotels Baton Rouge - 70808 LA',
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
                      color: kAccentColorLight
                    ),
                    child: ApartmentContactsColumn(
                      textColor: Theme.of(context).primaryColor,
                      phoneNumber: '(225) 853-1298',
                      address: '127 Western St. Baton Rouge, 70802 LA',
                      website: 'https://www.lsu.edu',
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
