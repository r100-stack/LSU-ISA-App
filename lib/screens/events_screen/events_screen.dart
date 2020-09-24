import 'package:flutter/material.dart';
import 'package:isa_app/services/networking.dart';

import 'widgets/events_stream_builder.dart';

class EventsScreen extends StatelessWidget {
  static final String routeName = '/events';

  @override
  Widget build(BuildContext context) {
    Networking.downloadEventsOnce(context);
    
    return Column(
      children: [
        Expanded(child: EventsStreamBuilder()),
      ],
    );
  }
}