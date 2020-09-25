import 'package:flutter/material.dart';
import 'package:isa_app/blocs/airbnb_bloc.dart';
import 'package:isa_app/blocs/apartment_bloc.dart';
import 'package:isa_app/blocs/event_bloc.dart';
import 'package:isa_app/blocs/hotels_bloc.dart';
import 'package:isa_app/blocs/officer_bloc.dart';
import 'package:isa_app/screens/apartments_screen/apartments_screen.dart';
import 'package:isa_app/screens/chat_home/chat_home.dart';
import 'package:isa_app/screens/chat_screen/chat_screen.dart';
import 'package:isa_app/screens/events_screen/events_screen.dart';
import 'package:isa_app/screens/home_screen/home_screen.dart';
import 'package:isa_app/screens/hotels_screen/hotels_screen.dart';
import 'package:isa_app/screens/offers_screen/offers_screen.dart';
import 'package:isa_app/screens/officer_details_screen/officer_details_screen.dart';
import 'package:isa_app/screens/officers_screen/officers_screen.dart';
import 'package:provider/provider.dart';

import 'screens/event_details/event_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApartmentBloc>.value(
          value: ApartmentBloc(),
        ),
        ChangeNotifierProvider.value(
          value: HotelBloc(),
        ),
        ChangeNotifierProvider.value(
          value: AirbnbBloc(),
        ),
        ChangeNotifierProvider.value(
          value: OfficerBloc(),
        ),
        ChangeNotifierProvider.value(
          value: EventBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'LSU ISA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Color(0xFF461D7C),
            accentColor: Color(0xFFFDD023)),
        onGenerateRoute: (RouteSettings settings) {
          var routes = <String, WidgetBuilder>{
            HomeScreen.routeName: (context) => HomeScreen(),
            ApartmentsScreen.routeName: (context) => ApartmentsScreen(),
            OffersScreen.routeName: (context) =>
                OffersScreen(settings.arguments),
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
                )
          };

          WidgetBuilder builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder(ctx));
        },
      ),
    );
  }
}
