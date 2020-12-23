import 'package:flutter/material.dart';

import 'package:isa_app/constants.dart';
import 'package:isa_app/widgets/custom_card.dart';

class ImageContentCard extends StatelessWidget {
  final Function onTap;
  final Widget image;
  final Widget content;

  const ImageContentCard({
    this.onTap,
    @required this.image,
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCard(
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                flex: 45,
                child: image,
              ),
              SizedBox(
                width: kDefaultMargin / 4,
              ),
              Expanded(flex: 55, child: content),
            ],
          ),
        ),
      ),
    );
  }
}
