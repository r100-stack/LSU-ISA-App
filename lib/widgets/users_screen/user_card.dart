import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/user.dart';
import 'package:isa_app/widgets/custom_circle_image.dart';
import 'package:isa_app/widgets/custom_image.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: kDefaultMargin / 2, horizontal: kDefaultMargin / 2),
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultMargin)),
        child: Stack(
          children: [
            CustomImage(user.bannerImageUrl),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 110,
                child: Padding(
                  padding: EdgeInsets.only(left: kDefaultMargin/2, right: kDefaultMargin/2, bottom: kDefaultMargin/2),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(kDefaultMargin/4),
                      child: Row(
                        children: [
                          CustomCircleImage(
                            imageUrl: user.profileImageUrl,
                            radius: 20,
                          ),
                          SizedBox(
                            width: kDefaultMargin / 2,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: kDefaultMargin / 2,
                                ),
                                Text(
                                  user.tagline,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
