import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/officer.dart';
import 'package:isa_app/screens/officer_details_screen.dart';
import 'package:isa_app/widgets/custom_card.dart';
import 'package:isa_app/widgets/custom_divider.dart';

class OfficerCard extends StatelessWidget {
  final Officer officer;

  OfficerCard(this.officer);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OfficerDetailsScreen.routeName,
            arguments: officer);
      },
      child: CustomCard(
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
                          image: NetworkImage(officer.bannerImageUrl),
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
                        backgroundImage:
                            NetworkImage(officer.profileImageUrl ?? ''),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kDefaultMargin / 2,
            ),
            Text(
              officer.name,
              maxLines: 2,
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
              '"${officer.tagline}"',
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
    );
  }
}
