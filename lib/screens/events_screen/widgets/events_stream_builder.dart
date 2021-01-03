import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/event_bloc.dart';
import 'package:isa_app/models/event.dart';
import 'package:provider/provider.dart';

import 'event_card.dart';

class EventsStreamBuilder extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // List<Event> events = Provider.of<EventBloc>(context).events;

    double width = MediaQuery.of(context).size.width;

    return StreamBuilder(
      stream: _firestore.collection('events').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<dynamic> eventsFirebase = snapshot.data.documents;
        List<Event> events = eventsFirebase
            .map((eventFirebase) => Event.fromDocumentSnapshot(eventFirebase))
            .toList();

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
      },
    );
  }
}
