import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/widgets/custom_divider.dart';
import 'package:isa_app/widgets/image_content_card.dart';

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageContentCard(
      image: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          image: DecorationImage(
            image: NetworkImage(
              // 'https://commoncdn.entrata.com/images/thumbNailer.php?src=/media_library/3482/5e74fb235c4956.40374158757.jpg&w=960&h=540',
              'https://cdngeneral.rentcafe.com/dmslivecafe/3/847319/p0851766_11_1_PhotoGallery.jpg?&quality=85&',
            ),
            fit: BoxFit.cover
          ),
        ),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Breakfast party!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          CustomDivider(),
          Text(
            '28th August 2020',
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Saturday',
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '4:00 PM - 6:00 PM',
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
