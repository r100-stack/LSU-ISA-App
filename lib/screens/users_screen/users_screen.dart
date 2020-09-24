import 'package:flutter/material.dart';

import 'widgets/users_stream_builder.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users'),),
      body: UsersStreamBuilder(),
    );
  }
}