import 'package:flutter/material.dart';
import 'package:isa_app/widgets/custom_card.dart';
import 'package:isa_app/widgets/custom_divider.dart';
import 'package:isa_app/widgets/events_screen/events_stream_builder.dart';
import 'package:isa_app/widgets/image_content_card.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EventsStreamBuilder();
  }
}
