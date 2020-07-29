import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/main.dart';
import 'package:isa_app/models/user.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';
import 'package:isa_app/widgets/users_screen/user_card.dart';
import 'package:isa_app/widgets/users_screen/users_stream_builder.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users'),),
      body: UsersStreamBuilder(),
    );
  }
}