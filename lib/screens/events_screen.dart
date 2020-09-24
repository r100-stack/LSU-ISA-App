import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

import 'package:isa_app/services/networking.dart';
import 'package:isa_app/widgets/custom_card.dart';
import 'package:isa_app/widgets/custom_divider.dart';
import 'package:isa_app/widgets/events_screen/events_stream_builder.dart';
import 'package:isa_app/widgets/image_content_card.dart';

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