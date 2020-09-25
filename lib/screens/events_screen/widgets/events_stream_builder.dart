import 'package:flutter/material.dart';
import 'package:isa_app/blocs/event_bloc.dart';
import 'package:isa_app/models/event.dart';
import 'package:provider/provider.dart';

import 'event_card.dart';

class EventsStreamBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Event> events = Provider.of<EventBloc>(context).events;

    double width = MediaQuery.of(context).size.width;

    if (width <= 1000) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return EventCard(events[index]);
        },
        itemCount: events.length,
      );
    } else {
      int crossAxisCount = (width / 700).floor() + 1;

      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, childAspectRatio: 10 / 4),
        itemBuilder: (context, index) {
          return EventCard(events[index]);
        },
        itemCount: events.length,
      );
    }
  }
}
