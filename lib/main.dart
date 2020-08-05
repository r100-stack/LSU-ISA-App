import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/apartment_bloc.dart';
import 'package:isa_app/screens/apartments_screen.dart';
import 'package:isa_app/screens/hotels_screen.dart';
import 'package:isa_app/screens/offers_screen.dart';
import 'package:isa_app/screens/users_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApartmentBloc>.value(
      value: ApartmentBloc(),
      child: MaterialApp(
        title: 'LSU ISA',
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
          accentColor: Color(0xFFFDD023)
        ),
        onGenerateRoute: (RouteSettings settings) {
          var routes = <String, WidgetBuilder>{
            ApartmentsScreen.routeName: (context) => ApartmentsScreen(),
            OffersScreen.routeName: (context) => OffersScreen(settings.arguments),
            HotelsScreen.routeName: (context) => HotelsScreen()
          };

          WidgetBuilder builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder(ctx));
        },
        initialRoute: HotelsScreen.routeName,
      ),
    );
  }
}
