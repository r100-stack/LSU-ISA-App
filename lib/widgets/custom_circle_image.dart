import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/widgets/custom_image.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';

class CustomCircleImage extends StatelessWidget {
  final String imageUrl;
  final double radius;

  CustomCircleImage({this.imageUrl, this.radius = 20});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: ClipOval(
        child: CustomImage(imageUrl),
      ),
    );
  }
}
