import 'package:flutter/material.dart';

import 'package:isa_app/models/chat_message.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:isa_app/widgets/custom_card.dart';

import '../../../constants.dart';

class ChatMessageCard extends StatelessWidget {
  final ChatMessage chatMessage;
  final User1 currentUser;

  const ChatMessageCard({
    @required this.chatMessage,
    @required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    bool isMe = chatMessage.uid == currentUser?.uid;

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .6,
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultMargin, vertical: kDefaultMargin / 2),
          margin: const EdgeInsets.symmetric(vertical: kDefaultMargin / 4),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            color: isMe ? kAccentColorLight : Colors.white,
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          ),
          child: Text(chatMessage.message),
        ),
      ],
    );
  }
}
