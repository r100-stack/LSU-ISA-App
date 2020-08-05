import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/screens/apartments_screen.dart';
import 'package:isa_app/screens/hotels_screen.dart';
import 'package:isa_app/services/networking.dart';
import 'package:isa_app/widgets/apartments_screen/apartments_stream_builder.dart';
import 'package:isa_app/widgets/home_screen/page_selector_bar.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ISA LSU',
          style: Theme.of(context).textTheme.headline4.copyWith(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: CurrentPageScreen(),
    );
  }
}

class CurrentPageScreen extends StatefulWidget {
  @override
  _CurrentPageScreenState createState() => _CurrentPageScreenState();
}

class _CurrentPageScreenState extends State<CurrentPageScreen> {
  final List<String> pages = ['Housing', 'Users'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(kDefaultBorderRadius),
                  bottomRight: Radius.circular(kDefaultBorderRadius))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultMargin / 2),
            child: PageSelectorBar(
              pages: pages,
              onPageSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedIndex: selectedIndex,
            ),
          ),
        ),
        Expanded(
          child: selectedIndex == 0 ? ApartmentsScreen() : HotelsScreen(),
        )
      ],
    );
  }
}
