import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/utils/image_utils.dart';

class TopImageStack extends StatelessWidget {
  final Size size;
  final String imageUrl;
  final String title;
  final String heroId;
  final Widget widget;

  const TopImageStack(
      {@required this.size, @required this.imageUrl, @required this.title, this.heroId = '', this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .4,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Hero(
            tag: heroId,
            child: Container(
              height: size.height * .4 - 35,
              decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: ImageUtils.getApartmentImage(imageUrl))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(kDefaultMargin),
              child: widget,
              // child: Container(
              //   decoration: BoxDecoration(
              //       color: Theme.of(context).accentColor,
              //       boxShadow: kSecondaryBoxShadow,
              //       borderRadius: BorderRadius.all(
              //           Radius.circular(kDefaultBorderRadius))),
              //   height: 70,
              //   child: Center(
              //     child: widget,
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
