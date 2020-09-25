import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final _kAppBarHeightWithMargins = kAppBarHeight + kDefaultMargin / 2;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      centerTitle: true,
      toolbarHeight: _kAppBarHeightWithMargins,
      title: Image(
        image: AssetImage('assets/images/logo.png'),
        height: kAppBarHeight,
        width: kAppBarHeight * 2,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_kAppBarHeightWithMargins);
}
