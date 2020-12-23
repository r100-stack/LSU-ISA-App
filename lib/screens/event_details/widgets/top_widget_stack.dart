import 'package:flutter/material.dart';

import '../../../constants.dart';

class TopWidgetStack extends StatelessWidget {
  final Size size;
  final String heroId;
  final Widget background;
  final Widget title;
  final double height;

  const TopWidgetStack(
      {@required this.size,
      this.heroId = '',
      this.background,
      this.title,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? size.height * .4,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Hero(
            tag: heroId,
            child: Container(
              height: height != null ? height -35 : size.height * .4 - 35,
              child: background,
            ),
            // child: Text('dasd'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(kDefaultMargin),
              child: title,
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