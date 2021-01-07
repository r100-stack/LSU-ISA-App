import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/auth_bloc.dart';
import 'package:isa_app/blocs/correct_screen_bloc.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/page_def.dart';
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
import 'package:roipil_authentication/blocs/roipil_auth_bloc.dart';

import 'widgets/page_selector_bar.dart';
import 'package:isa_app/utils/auth_utils.dart';

// import 'package:roipil_authentication/services/auth_service.dart' as roi;
import 'package:firebase_auth/firebase_auth.dart' as auth;

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
            onDetailsPressed: () => AuthUtils.showSignInAlert(context),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    // roi.AuthService.user.listen((auth.User user) async {
    //   print('Event: $user');

    //   if (user != null) {
    //     DocumentSnapshot snapshot = await kUsersRef.doc(user.uid).get();
    //     User1 customUser =
    //         User1.fromDocumentSnapshotAndFirebaseUser(user, snapshot);
    //     Provider.of<AuthBloc>(context, listen: false).updateUser(customUser);
    //   }

    //   // kUsersRef.doc(user.uid).snapshots().get((DocumentSnapshot snapshot) {
    //   //   User1 customUser =
    //   //       User1.fromDocumentSnapshotAndFirebaseUser(user, snapshot);
    //   //   Provider.of<AuthBloc>(context, listen: false).updateUser(customUser);
    //   // });
    //   // Provider.of<AuthBloc>(context, listen: false).updateUser(event);
    // });
  }

  @override
  Widget build(BuildContext context) {
    // User1 currentUser = Provider.of<AuthBloc>(context).currentUser;
    // User1 currentUser = context.watch<AuthBloc>().currentUser;
    // String trial = context.watch<AuthBloc>().trial;
    User1 currentUser = Provider.of<RoipilAuthBloc>(context).user;
    print('BUILD CALLED: ${currentUser?.name}');

    int selectedIndex = Provider.of<CorrectScreenBloc>(context).selectedIndex;
    List<PageDef> pages =
        Provider.of<CorrectScreenBloc>(context, listen: false).pages;

    Widget currentPage = pages[selectedIndex].widget;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: _buildDrawer(context, currentUser, pages),
      body: currentPage
      // body: Column(
      //   children: [
      //     FlatButton(
      //       child: Text('Show current user'),
      //       onPressed: () {
      //         User1 currentUser =
      //             Provider.of<AuthBloc>(context, listen: false).currentUser;
      //         print(currentUser);
      //       },
      //     ),
      //     FlatButton(
      //       child: Text('Change trial'),
      //       onPressed: () {
      //         String trial =
      //             Provider.of<AuthBloc>(context, listen: false).trial;
      //         trial = trial + '1';
      //         Provider.of<AuthBloc>(context, listen: false).updateTrial(trial);

      //         trial = Provider.of<AuthBloc>(context, listen: false).trial;
      //         print('Trial from the FlatButton onPressed is $trial');
      //       },
      //     ),
      //   ],
      // ),
    );
  }
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

    String displayName = Provider.of<RoipilAuthBloc>(context)?.user?.name;
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
    String name = Provider.of<RoipilAuthBloc>(context)?.user?.name;
    return name;
  }
}
