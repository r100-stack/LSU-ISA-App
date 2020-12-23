import 'package:flutter/material.dart';

import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/screens/chat_screen/chat_screen.dart';
import 'package:isa_app/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class ChatChannelCard extends StatelessWidget {
  final ChatChannel chatChannel;

  const ChatChannelCard({
    this.chatChannel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () => Navigator.pushNamed(context, ChatScreen.routeName,
          arguments: chatChannel),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(chatChannel.imageUrl),
        ),
        title: Text(chatChannel.name),
        subtitle: Text(chatChannel.description),
      ),
    );
  }
}
