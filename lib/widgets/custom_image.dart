import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;

  CustomImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: double.maxFinite,
      width: double.maxFinite,
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (context, url) => CustomProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.broken_image),
    );
  }
}
