import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/offer.dart';
import 'package:isa_app/utils/string_utils.dart';

class OptionCard extends StatelessWidget {
  final Option option;

  OptionCard(this.option);

  @override
  Widget build(BuildContext context) {
    String name = _getName(option.name);
    String cost = _getCost(option.cost);

    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(kDefaultMargin/2),
        child: Column(
          children: [
            Text(name, style: Theme.of(context).textTheme.subtitle1,),
            SizedBox(height: kDefaultMargin/4,),
            Text(cost, style: Theme.of(context).textTheme.headline5,),
          ],
        ),
      ),
    );
  }

  String _getName(String name) {
    return (name ?? '').inCaps;
  }

  String _getCost(Cost cost) {
    switch(cost.type) {
      case CostType.EXACT:
        return '\$${cost.cost.floor()}';
        break;
      case CostType.FROM:
        return 'From \$${cost.cost.floor()}';
        break;
      case CostType.RANGE:
        return '\$${cost.cost.floor()} - \$${cost.costMax.floor()}';
        break;
    }
    return cost.cost.toString();
  }
}
