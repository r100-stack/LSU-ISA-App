import 'package:flutter/material.dart';
import 'package:isa_app/widgets/text_bubble.dart';

class WrapRow extends StatelessWidget {
  final List<Widget> children;

  WrapRow({this.children = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: children,
        ),
      ],
    );
  }
}
