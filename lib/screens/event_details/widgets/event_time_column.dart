import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isa_app/constants.dart';

import 'package:isa_app/models/event.dart';
import 'package:isa_app/screens/offers_screen/widgets/apartments_contacts_card.dart';

class EventTimeColumn extends StatelessWidget {
  final Event event;

  const EventTimeColumn({
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    DateFormat dayFormat = DateFormat('EEEEEE');
    DateFormat dateFormat = DateFormat('dd MMMM yyyy');
    DateFormat timeFormat = DateFormat('hh:mm a');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin / 2),
      child: Column(
        children: [
          _PaddedApartmentContactsCard(
            leading: Icons.access_time,
            title: '${dayFormat.format(event.startDate)}\n'
                '${dateFormat.format(event.startDate)}\n'
                '${timeFormat.format(event.startDate)} - ${timeFormat.format(event.endDate)}',
            maxLines: 100,
          )
        ]
          ..addAll(
            event.location.map(
              (event) => _PaddedApartmentContactsCard(
                leading: event.type == LOCATION_TYPE.ONLINE
                    ? Icons.public
                    : Icons.location_on,
                title:
                    '${event.type == LOCATION_TYPE.ONLINE ? 'Online' : 'In-Person'}\n'
                    '${event.title != null ? event.title + '\n' : ''}'
                    '${event.data}',
                url: event.type == LOCATION_TYPE.ONLINE
                    ? event.data
                    : 'https://www.google.com/maps/search/${event.data}',
                maxLines: 100,
                copyIsUrl: true,
              ),
            ),
          )
          ..addAll(event.links
              .map((link) => _PaddedApartmentContactsCard(
                    leading: Icons.group_add,
                    title: link.title,
                    url: link.data,
                    copy: link.data,
                  ))
              .toList()),
      ),
    );
  }
}

class _PaddedApartmentContactsCard extends StatelessWidget {
  final String title;
  final IconData leading;
  final String copy;
  final String url;
  final Color textColor;
  final int maxLines;

  final bool copyIsUrl;
  final bool copyIsTitle;

  _PaddedApartmentContactsCard(
      {this.title,
      this.leading,
      this.copy,
      this.url,
      this.textColor,
      this.maxLines,
      this.copyIsUrl = false,
      this.copyIsTitle = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultMargin / 2),
      child: ApartmentContactsCard(
        leading: leading,
        title: title,
        url: url,
        maxLines: maxLines,
        textColor: textColor,
        copy: copy,
        copyIsUrl: copyIsUrl,
        copyIsTitle: copyIsTitle,
      ),
    );
  }
}
