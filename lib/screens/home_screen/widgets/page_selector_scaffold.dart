import 'package:flutter/material.dart';

class PageSelectorScaffold extends StatelessWidget {
  final Widget body;

  PageSelectorScaffold({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
