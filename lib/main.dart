import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/airbnb_bloc.dart';
import 'package:isa_app/blocs/apartment_bloc.dart';
import 'package:isa_app/blocs/correct_screen_bloc.dart';
import 'package:isa_app/blocs/event_bloc.dart';
import 'package:isa_app/blocs/hotels_bloc.dart';
import 'package:isa_app/blocs/officer_bloc.dart';
import 'package:isa_app/cache/uid_name_cache.dart';
import 'package:isa_app/constants/firebase_constants.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:isa_app/screens/apartments_screen/apartments_screen.dart';
import 'package:isa_app/screens/chat_home/chat_home.dart';
import 'package:isa_app/screens/chat_screen/chat_screen.dart';
import 'package:isa_app/screens/event_details/event_details.dart';
import 'package:isa_app/screens/events_screen/events_screen.dart';
import 'package:isa_app/screens/home_screen/home_screen.dart';
import 'package:isa_app/screens/hotels_screen/hotels_screen.dart';
import 'package:isa_app/screens/offers_screen/offers_screen.dart';
import 'package:isa_app/screens/officer_details_screen/officer_details_screen.dart';
import 'package:isa_app/screens/officers_screen/officers_screen.dart';
import 'package:isa_app/screens/user_modify_details_screen/user_modify_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:roipil_authentication/blocs/roipil_auth_bloc.dart';
import 'package:roipil_authentication/roipil_authentication.dart';
import 'package:roipil_authentication/screens/sign_in_screen.dart';

void main() async {
  RoipilAuthentication.initializeApp(kRoipilUsersRef, kRoipilExtendedUsersRef);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RoipilAuthBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => ApartmentBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => HotelBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => AirbnbBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => OfficerBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => EventBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => CorrectScreenBloc(),
        ),
        Provider<UidNameCache>(
          create: (_) => UidNameCache(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AfterLayoutMixin<MyApp> {
  @override
  void afterFirstLayout(BuildContext context) {
    RoipilAuthentication.initialAuthUpdates(context, () => User1());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LSU ISA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color(0xFF461D7C),
        accentColor: Color(0xFFFDD023),
      ),
      onGenerateRoute: (RouteSettings settings) {
        Map<String, WidgetBuilder> routes = {
          HomeScreen.routeName: (context) => HomeScreen(),
          ApartmentsScreen.routeName: (context) => ApartmentsScreen(),
          OffersScreen.routeName: (context) => OffersScreen(settings.arguments),
          OfficersScreen.routeName: (context) => OfficersScreen(),
          OfficerDetailsScreen.routeName: (context) =>
              OfficerDetailsScreen(settings.arguments),
          HotelsScreen.routeName: (context) => HotelsScreen(),
          EventsScreen.routeName: (context) => EventsScreen(),
          EventDetailsScreen.routeName: (context) =>
              EventDetailsScreen(settings.arguments),
          ChatHome.routeName: (context) => ChatHome(),
          ChatScreen.routeName: (context) => ChatScreen(
                chatChannel: settings.arguments,
              ),
          SignInScreen.routeName: (context) => SignInScreen(
                onSignIn: settings.arguments,
              )
        };

        return MaterialPageRoute(
            builder: routes[settings.name], settings: settings);
      },
    );
  }
}
