import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:isa_app/constants.dart';
import 'package:isa_app/models/event.dart';
import 'package:isa_app/screens/event_details/event_details.dart';
import 'package:isa_app/widgets/custom_divider.dart';
import 'package:isa_app/widgets/image_content_card.dart';

import 'package:timeago/timeago.dart' as timeago;

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard(this.event);

  @override
  Widget build(BuildContext context) {
    TimeOfDay startTime = TimeOfDay.fromDateTime(event.startDate.toLocal());
    TimeOfDay endTime = TimeOfDay.fromDateTime(event.endDate.toLocal());

    DateFormat dayFormat = DateFormat('EEEEEE');
    DateFormat dateFormat = DateFormat('dd MMMM yyyy');
    DateFormat timeFormat = DateFormat('hh:mm a');

    return ImageContentCard(
      image: GestureDetector(
        onTap: () => Navigator.pushNamed(context, EventDetailsScreen.routeName,
            arguments: event),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            image: DecorationImage(
                image: NetworkImage(event.imageUrls[0] ?? ''
                    // TODO: Placeholder image
                    // 'https://commoncdn.entrata.com/images/thumbNailer.php?src=/media_library/3482/5e74fb235c4956.40374158757.jpg&w=960&h=540',
                    // 'https://cdngeneral.rentcafe.com/dmslivecafe/3/847319/p0851766_11_1_PhotoGallery.jpg?&quality=85&',
                    ),
                fit: BoxFit.cover),
          ),
        ),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            event.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          CustomDivider(),
          Text(
            dayFormat.format(event.startDate),
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            // '${event.startDate.day} ${event.startDate.toLocal().month} ${event.startDate.toLocal().year}',
            dateFormat.format(event.startDate),
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            // '${startTime.hourOfPeriod}:${startTime.minute} ${startTime.period} - 6:00 PM',
            '${timeFormat.format(event.startDate)} - ${timeFormat.format(event.endDate)}',
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: kDefaultMargin / 2,
          ),
          Text(
            '(${timeago.format(event.startDate, allowFromNow: true)})',
            style: Theme.of(context).textTheme.subtitle2,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
