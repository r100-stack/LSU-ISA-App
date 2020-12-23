import 'package:flutter/material.dart';
import 'package:isa_app/screens/chat_home/chat_home.dart';

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
      actions: [
        IconButton(
            icon: Icon(Icons.chat),
            onPressed: () => Navigator.pushNamed(context, ChatHome.routeName))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_kAppBarHeightWithMargins);
}
