import 'package:flutter/material.dart';
import 'package:isa_app/screens/chat_home/widgets/chat_channels_builder.dart';
import 'package:isa_app/widgets/custom_appbar.dart';

class ChatHome extends StatelessWidget {
  static final String routeName = '/chat_channels';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Channels'),
      ),
      body: ChatChannelsBuilder(),
    );
  }
}
