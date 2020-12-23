import 'package:flutter/material.dart';

const double kDefaultMargin = 20;
const double kDefaultBorderRadius = 20;

const Color kAccentColorLight = Color(0xFFFEE891);
const Color kPrimaryColorLight = Color(0xFFC7BBD7);

final List<BoxShadow> kPrimaryBoxShadow = [
  BoxShadow(
      offset: Offset(0, 10),
      color: Color(0xFFD3D3D3).withOpacity(.84),
      blurRadius: 33)
];

final List<BoxShadow> kSecondaryBoxShadow = [
  BoxShadow(
      offset: Offset(0, 5),
      color: Color(0xFF3D3D3D).withOpacity(.5),
      blurRadius: 10)
];

final List<BoxShadow> kBackButtonShadow = [
  // BoxShadow(
  //     offset: Offset(0, 0),
  //     color: Color(0xFF3D3D3D).withOpacity(.2),
  //     blurRadius: 10)
  BoxShadow(
      offset: Offset(0, 5),
      color: Color(0xFF3D3D3D).withOpacity(1),
      blurRadius: 50)
];

const EdgeInsets kCardMargin = EdgeInsets.symmetric(
    vertical: kDefaultMargin / 2, horizontal: kDefaultMargin);

const EdgeInsets kCardPadding = EdgeInsets.all(kDefaultMargin / 2);

const double kDefaultMaxWidth = 600;

const double kAppBarHeight = kToolbarHeight * 1.5;