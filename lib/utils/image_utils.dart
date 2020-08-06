import 'package:flutter/material.dart';

class ImageUtils {
  static ImageProvider getApartmentImage(String imageUrl) {
    return imageUrl != null
        ? NetworkImage(imageUrl)
        : AssetImage('assets/images/placeholder_apartment.png');
  }

  static ImageProvider getUserProfilePicture(String imageUrl) {
    return imageUrl != null
        ? NetworkImage(imageUrl)
        : AssetImage('assets/images/placeholder_user_profile.png');
  }

  static ImageProvider getUserBackgroundImage(String imageUrl) {
    return imageUrl != null
        ? NetworkImage(imageUrl)
        : AssetImage('assets/images/placeholder_user_background.png');
  }
}
