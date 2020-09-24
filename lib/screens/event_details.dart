import 'package:flutter/material.dart';

import 'package:isa_app/models/event.dart';

class EventDetailsScreen extends StatelessWidget {
  static final String routeName = '/event_details';

  final Event event;

  const EventDetailsScreen(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(event.name));
  }
}
