import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/officer.dart';
import 'package:isa_app/screens/offers_screen/widgets/top_image_stack.dart';
import 'package:isa_app/screens/officers_screen/widgets/profile_image.dart';
import 'package:isa_app/utils/image_utils.dart';
import 'package:isa_app/widgets/custom_back_button.dart';
import 'package:isa_app/widgets/custom_card.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class OfficerDetailsScreen extends StatelessWidget {
  static final String routeName = '/officer_details';

  final Officer officer;

  OfficerDetailsScreen(this.officer);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kAccentColorLight,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.white,
                constraints: BoxConstraints(maxWidth: kDefaultMaxWidth),
                child: Column(
                  children: [
                    TopImageStack(
                      size: size,
                      image: ImageUtils.getUserBackgroundImage(
                          officer.bannerImageUrl),
                      widget: Container(
                        decoration: BoxDecoration(boxShadow: kPrimaryBoxShadow),
                        child: Hero(
                          tag: 'officer_profile_picture${officer.id}',
                          child: ProfileImage(
                            profileImageUrl: officer.profileImageUrl,
                          ),
                          // child: CircleAvatar(
                          //   radius: 70,
                          //   backgroundImage: ImageUtils.getUserProfilePicture(
                          //       officer.profileImageUrl),
                          // ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: kDefaultMargin,
                        right: kDefaultMargin,
                        bottom: kDefaultMargin,
                      ),
                      child: Column(
                        children: [
                          Text(
                            officer.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.black87),
                          ),
                          SizedBox(height: kDefaultMargin / 8),
                          Text(
                            officer.position,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: kDefaultMargin / 2),
                          Text(
                            officer.tagline != null
                                ? '"${officer.tagline}"'
                                : '',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(color: Colors.grey),
                          ),
                          SizedBox(
                            height: kDefaultMargin,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              SocialIcon(
                                icon: FontAwesomeIcons.instagram,
                                url: officer.instagramLink,
                              ),
                              SocialIcon(
                                icon: FontAwesomeIcons.facebook,
                                url: officer.facebookLink,
                              ),
                              SocialIcon(
                                icon: FontAwesomeIcons.twitter,
                                url: officer.twitterLink,
                              ),
                              SocialIcon(
                                icon: FontAwesomeIcons.linkedin,
                                url: officer.linkedinLink,
                              ),
                              SocialIcon(
                                icon: Icons.public,
                                url: officer.websiteLink,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: kDefaultMargin / 2),
                            child: Container(
                              width: 20,
                              height: 5,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          Text(officer.description ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(letterSpacing: 1, height: 2)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomBackButton()
        ],
      ),
    );

    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Container(
    //         height: size.height * .4,
    //         child: Stack(
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                   image: NetworkImage(officer.bannerImageUrl),
    //                   fit: BoxFit.cover
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  SocialIcon({this.url, this.icon});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: url != null,
      child: GestureDetector(
        onTap: () => _launchUrl(url, context),
        child: CustomCard(
          child: Icon(icon),
        ),
      ),
    );
  }

  void _launchUrl(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Error launching the url: $url');
      Alert(context: context, title: 'Sorry, couldn\'t open that.').show();
    }
  }
}
