import 'package:flutter/material.dart';

import 'package:isa_app/models/chat_message.dart';
import 'package:isa_app/widgets/custom_card.dart';

import '../../../constants.dart';

class ChatMessageCard extends StatelessWidget {
  final ChatMessage chatMessage;

  const ChatMessageCard({
    this.chatMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultMargin, vertical: kDefaultMargin / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      child: Text(chatMessage.message),
    );
  }
}
