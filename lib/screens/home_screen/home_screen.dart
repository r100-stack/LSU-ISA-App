import 'package:flutter/material.dart';
import 'package:isa_app/blocs/auth_bloc.dart';
import 'package:isa_app/blocs/correct_screen_bloc.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:isa_app/screens/airbnbs_screen/airbnbs_screen.dart';
import 'package:isa_app/screens/apartments_screen/apartments_screen.dart';
import 'package:isa_app/screens/events_screen/events_screen.dart';
import 'package:isa_app/screens/hotels_screen/hotels_screen.dart';
import 'package:isa_app/screens/officers_screen/officers_screen.dart';
import 'package:isa_app/screens/user_modify_details_screen/user_modify_details_screen.dart';
import 'package:isa_app/utils/alert_utils.dart';
import 'package:isa_app/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import 'widgets/page_selector_bar.dart';
import 'package:isa_app/utils/auth_utils.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = '/';

  Drawer _buildDrawer(BuildContext context, User1 user) {
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
            onDetailsPressed: () => AuthUtils.showSignInAlert(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User1 currentUser = Provider.of<AuthBloc>(context).currentUser;
    
    int selectedIndex =
        Provider.of<CorrectScreenBloc>(context).selectedIndex;
    Widget currentPage = Provider.of<CorrectScreenBloc>(context, listen: false)
        .pages[selectedIndex]['pageWidget'];

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: _buildDrawer(context, currentUser),
      body: currentPage,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   Provider.of<AuthBloc>(context, listen: false).signInAnomously();

  //   return Scaffold(
  //     body: CurrentPageScreen(),
  //   );
  // }

}

class CurrentPageScreen extends StatefulWidget {
  @override
  _CurrentPageScreenState createState() => _CurrentPageScreenState();
}

class _CurrentPageScreenState extends State<CurrentPageScreen> {
  final List<String> pages = [
    'Apartments',
    'Hotels near LSU',
    'Airbnbs',
    'Committee Members',
    'Events'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> pageWidgets = {
      0: ApartmentsScreen(),
      1: HotelsScreen(),
      2: AirbnbsScreen(),
      3: OfficersScreen(),
      4: EventsScreen(),
    };

    String displayName = Provider.of<AuthBloc>(context)?.currentUser?.name;
    displayName == null || displayName.length == 0
        ? displayName = 'Generic LSU Tiger'
        : null;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: pages.length + 1,
          itemBuilder: (context, index) => index == 0
              // TODO: Removed all such commented out code. Clean the whole repo. Modularize code.
              // ? DrawerHeader(
              //     child: Text(
              //       'International Student Association Dashboard',
              //     ),
              //     decoration:
              //         BoxDecoration(color: Theme.of(context).accentColor),
              //   )
              ? UserAccountsDrawerHeader(
                  // onDetailsPressed: () {
                  //   Navigator.pop(context);
                  //   Navigator.pushNamed(
                  //       context, UserModifyDetailsScreen.routeName);
                  // },
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/placeholder_user_profile.png'),
                  ),
                  accountName: Text(displayName),
                  // accountEmail: Text('Tap to change name'),
                  accountEmail: Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          color: Colors.red,
                          child: Text('Signin'),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          color: Colors.red,
                          child: Text('Signin'),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                    ],
                  ),
                  // accountEmail: new DropdownButton<String>(
                  //   items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  //     return new DropdownMenuItem<String>(
                  //       value: value,
                  //       child: new Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (_) {},
                  // ),
                )
              // ? new DropdownButton<String>(
              //     items: <String>['A', 'B', 'C', 'D'].map((String value) {
              //       return new DropdownMenuItem<String>(
              //         value: value,
              //         child: new Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (_) {},
              //   )
              : ListTile(
                  title: Text(pages[index - 1]),
                  onTap: () {
                    setState(() => selectedIndex = index - 1);
                    Navigator.pop(context);
                  },
                ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   color: Theme.of(context).primaryColor,
          //   padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //         horizontal: kDefaultMargin / 4, vertical: kDefaultMargin / 2),
          //     child: Center(
          //       child: Text(
          //         'International Student Association at LSU',
          //         textAlign: TextAlign.center,
          //         style: Theme.of(context).textTheme.headline4.copyWith(
          //             color: Theme.of(context).accentColor,
          //             fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).primaryColor,
          //     // borderRadius: BorderRadius.only(
          //     //   bottomLeft: Radius.circular(kDefaultBorderRadius),
          //     //   bottomRight: Radius.circular(kDefaultBorderRadius),
          //     // ),
          //   ),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(vertical: kDefaultMargin / 2),
          //     child: PageSelectorBar(
          //       pages: pages,
          //       onPageSelected: (index) {
          //         setState(() {
          //           selectedIndex = index;
          //         });
          //       },
          //       selectedIndex: selectedIndex,
          //     ),
          //   ),
          // ),
          Expanded(
            child: pageWidgets[selectedIndex],
          )
        ],
      ),
    );
  }

  String _getCurrentUserName(BuildContext context) {
    String name = Provider.of<AuthBloc>(context).currentUser.name;
    return name;
  }
}
