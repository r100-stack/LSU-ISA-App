import 'package:flutter/material.dart';

import '../../../constants.dart';

class TopWidgetStackTitle extends StatelessWidget {
  final String title;
  final double height;

  const TopWidgetStackTitle({
    this.title,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          boxShadow: kSecondaryBoxShadow,
          borderRadius:
              BorderRadius.all(Radius.circular(kDefaultBorderRadius))),
      height: height ?? 70,
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline5.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
