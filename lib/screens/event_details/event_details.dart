import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

import 'package:isa_app/models/event.dart';
import 'package:isa_app/screens/event_details/widgets/event_time_column.dart';
import 'package:isa_app/screens/event_details/widgets/top_widget_stack_title.dart';
import 'package:isa_app/widgets/custom_card.dart';
import 'widgets/action_button.dart';
import 'widgets/top_widget_stack.dart';

class EventDetailsScreen extends StatelessWidget {
  static final String routeName = '/event_details';

  final Event event;

  const EventDetailsScreen(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopWidgetStack(
              title: TopWidgetStackTitle(
                title: event.name,
              ),
              size: MediaQuery.of(context).size,
              background: Container(
                color: kAccentColorLight,
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: 1),
                  items: event.imageUrls
                      .map((imageUrl) => Image(
                            image: NetworkImage(imageUrl),
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: kDefaultMargin / 2),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultMargin / 2),
              child: Column(
                children: [
                  Text(
                    event.description,
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: kDefaultMargin),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: kDefaultMargin,
                    runSpacing: kDefaultMargin,
                    children: [
                      ActionButton(
                        text: 'Have questions? Chat with us!',
                        icon: Icons.chat,
                        onTap: () => null,
                      )
                    ],
                  ),
                  const SizedBox(height: kDefaultMargin),
                  EventTimeColumn(
                    event: event,
                  ),
                  const SizedBox(
                    height: kDefaultMargin,
                  ),
                ],
              ),
            ),
            // Text(
            //   '${apartment.minSqft} sqft. - ${apartment.maxSqft} sqft.',
            //   style: Theme.of(context).textTheme.subtitle1,
            //   maxLines: 1,
            //   overflow: TextOverflow.ellipsis,
            // ),
          ],
        ),
      ),
    );
  }
}
