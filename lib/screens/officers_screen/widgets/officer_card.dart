import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/officer.dart';
import 'package:isa_app/screens/officer_details_screen/officer_details_screen.dart';
import 'package:isa_app/utils/image_utils.dart';
import 'package:isa_app/widgets/custom_card.dart';
import 'package:isa_app/widgets/custom_divider.dart';

class OfficerCard extends StatelessWidget {
  final Officer officer;

  OfficerCard(this.officer);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, OfficerDetailsScreen.routeName,
              arguments: officer);
        },
        child: CustomCard(
          padding: const EdgeInsets.all(0.0),
          margin: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(kDefaultBorderRadius)),
                        image: DecorationImage(
                            image: ImageUtils.getUserBackgroundImage(
                                officer.bannerImageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(kDefaultBorderRadius)),
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              kAccentColorLight.withOpacity(0.9),
                              kPrimaryColorLight.withOpacity(0.9),
                            ],
                            stops: [
                              0.0,
                              1.0
                            ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: 'officer_profile_picture${officer.id}',
                        child: CircleAvatar(
                            radius: 50,
                            backgroundImage: ImageUtils.getUserProfilePicture(
                                officer.profileImageUrl)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultMargin / 2, horizontal: kDefaultMargin),
                child: Column(
                  children: [
                    Text(
                      officer.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      officer.position,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    CustomDivider(),
                    Text(
                      officer.tagline != null ? '"${officer.tagline}"' : '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
