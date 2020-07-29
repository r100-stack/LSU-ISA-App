import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';

import 'dart:io' show Platform;

class CustomImage extends StatelessWidget {
  final String imageUrl;

  CustomImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    bool isMobile = false;
    try {
      isMobile = Platform.isAndroid || Platform.isIOS;
    } catch (e) {
      print(e);
    }

    return isMobile
        ? CachedNetworkImage(
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            placeholder: (context, url) => CustomProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.broken_image),
          )
        : Image(
            image: NetworkImage(imageUrl),
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          );
  }
}
