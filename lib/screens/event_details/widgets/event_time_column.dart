import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

    return Column(
      children: [
        ApartmentContactsCard(
          leading: Icons.access_time,
          title: '${dayFormat.format(event.startDate)}\n'
              '${dateFormat.format(event.startDate)}\n'
              '${timeFormat.format(event.startDate)} - ${timeFormat.format(event.endDate)}',
        )
      ]..addAll(
          event.location.map(
            (event) => ApartmentContactsCard(
              leading: event.type == LOCATION_TYPE.ONLINE ? Icons.public : Icons.location_on,
              title: '${event.type == LOCATION_TYPE.ONLINE ? 'Online' : 'In-Person'}\n'
              '${event.title != null ? event.title + '\n' : ''}'
              '${event.data}',
              url: event.type == LOCATION_TYPE.ONLINE ? event.data : 'https://www.google.com/maps/search/${event.data}',
            ),
          ),
        ),
    );
  }
}
