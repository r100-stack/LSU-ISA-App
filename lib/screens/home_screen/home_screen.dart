import 'package:flutter/material.dart';
import 'package:isa_app/blocs/correct_screen_bloc.dart';
import 'package:isa_app/models/page_def.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:isa_app/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:roipil_authentication/blocs/roipil_auth_bloc.dart';

import 'package:isa_app/utils/auth_utils.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Drawer _buildDrawer(BuildContext context, User1 user, List<PageDef> pages) {
    String displayName = AuthUtils.getDisplayUserName(user);
    String displayEmail = AuthUtils.getDisplayUserSubtitle(user);

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              // TODO: Enable users to add their own image.
              backgroundImage:
                  AssetImage('assets/images/placeholder_user_profile.png'),
            ),
            accountName: Text(displayName),
            accountEmail: Text(displayEmail),
            onDetailsPressed: () {
              User1 user = Provider.of<RoipilAuthBloc>(context, listen: false).user;
              AuthUtils.showCorrectAuthenticationAlert(context, user);
            },
          ),
        ]..addAll(pages.asMap().entries.map((entry) {
            PageDef pageDef = entry.value;
            int index = entry.key;

            return GestureDetector(
              onTap: () {
                Provider.of<CorrectScreenBloc>(context, listen: false)
                    .setSelectedIndex(index);
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(pageDef.name),
              ),
            );
          }).toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User1 currentUser = Provider.of<RoipilAuthBloc>(context).user;

    int selectedIndex = Provider.of<CorrectScreenBloc>(context).selectedIndex;
    List<PageDef> pages =
        Provider.of<CorrectScreenBloc>(context, listen: false).pages;

    Widget currentPage = pages[selectedIndex].widget;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: _buildDrawer(context, currentUser, pages),
      body: currentPage
    );
  }
}