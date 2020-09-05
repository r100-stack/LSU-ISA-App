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

    return EventCategoriesContainer();
    // return Column(
    //   children: [
    //     Expanded(child: EventsStreamBuilder()),
    //   ],
    // );
  }
}

class EventCategoriesContainer extends StatefulWidget {
  const EventCategoriesContainer({
    Key key,
  }) : super(key: key);

  @override
  _EventCategoriesContainerState createState() =>
      _EventCategoriesContainerState();
}

class _EventCategoriesContainerState extends State<EventCategoriesContainer> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Theme(
            data: ThemeData(accentColor: Colors.yellow),
            child: Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                // labelColor: Theme.of(context).accentColor,
                onTap: (index) => setState(() => _selectedIndex = index),
                labelStyle: Theme.of(context).textTheme.headline6,
                tabs: [
                  Tab(
                    icon: Icon(Icons.update),
                    text: 'Upcoming',
                    // child: CustomTab(
                    //   text: 'Upcoming',
                    //   isSelected: _selectedIndex == 0,
                    // ),
                  ),
                  Tab(
                    text: 'Past',
                    icon: Icon(Icons.history)
                    // child: CustomTab(
                    //   text: 'Past',
                    //   isSelected: _selectedIndex == 1,
                    // ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [EventsStreamBuilder(), EventsStreamBuilder()],
            ),
          )
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CustomTab({@required this.text, @required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: isSelected ? Colors.white : Colors.red),
      ),
    );
  }
}
