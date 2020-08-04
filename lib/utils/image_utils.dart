import 'package:flutter/material.dart';

class ImageUtils {
  static ImageProvider getApartmentImage(String imageUrl) {
    return imageUrl != null
        ? NetworkImage(imageUrl)
        : AssetImage('assets/images/placeholder_apartment.png');
  }
}