import 'package:flutter/material.dart';

import 'package:isa_app/widgets/custom_card.dart';

import '../../../constants.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;

  const ActionButton({
    this.text,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: CustomCard(
        onTap: onTap,
        margin: const EdgeInsets.all(0.0),
        child: Row(
          children: [
            Icon(
              Icons.image,
              color: Theme.of(context).accentColor,
            ),
            const SizedBox(
              width: kDefaultMargin / 2,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
