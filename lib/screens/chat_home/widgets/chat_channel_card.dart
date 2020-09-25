import 'package:flutter/material.dart';

import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/widgets/custom_card.dart';

class ChatChannelCard extends StatelessWidget {
  final ChatChannel chatChannel;

  const ChatChannelCard({
    this.chatChannel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () => {},
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
