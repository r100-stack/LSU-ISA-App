import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';

import 'dart:io' show Platform;

import 'package:transparent_image/transparent_image.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;

  CustomImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return imageUrl == null
        ? Image(
            image: AssetImage('assets/images/placeholder_apartment.png'),
          )
        : Stack(
            children: [
              Center(
                child: CustomProgressIndicator(),
              ),
              Align(
                alignment: Alignment.center,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageUrl,
                ),
              ),
            ],
          );

    //   return isMobile
    //       ? CachedNetworkImage(
    //           // height: double.maxFinite,
    //           width: 100,
    //           fit: BoxFit.cover,
    //           imageUrl: imageUrl,
    //           // placeholder: (context, url) => CustomProgressIndicator(),
    //           errorWidget: (context, url, error) => Icon(Icons.broken_image),
    //         )
    //       : Image(
    //           image: NetworkImage(imageUrl),
    //           height: double.maxFinite,
    //           width: double.maxFinite,
    //           fit: BoxFit.cover,
    //         );
    // }
  }
}
