import 'package:flutter/material.dart';

import 'package:isa_app/models/chat_channel.dart';

class ChatScreen extends StatelessWidget {
  static final String routeName = '/chat';

  final String chatChannelId;

  const ChatScreen({
    this.chatChannelId,
  });

  @override
  Widget build(BuildContext context) {
    print(chatChannelId);

    return Scaffold();
  }
}
