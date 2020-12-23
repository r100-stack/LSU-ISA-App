import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String profileImageUrl;

  const ProfileImage({
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return profileImageUrl != null
        ? CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(profileImageUrl),
            backgroundColor: Colors.transparent,
          )
        : CircleAvatar(
            radius: 70,
            backgroundImage:
                AssetImage('assets/images/placeholder_user_profile.png'),
            backgroundColor: Colors.transparent,
          );
  }
}
