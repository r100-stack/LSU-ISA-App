import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

class OptionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(kDefaultMargin/2),
        child: Column(
          children: [
            Text('Standard', style: Theme.of(context).textTheme.subtitle1,),
            SizedBox(height: kDefaultMargin/4,),
            Text('\$400', style: Theme.of(context).textTheme.headline5,),
          ],
        ),
      ),
    );
  }
}
