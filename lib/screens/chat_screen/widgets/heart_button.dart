import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/constants/dimension_constants.dart';

import 'package:isa_app/constants/firebase_constants.dart';
import 'package:isa_app/models/chat_message.dart';
import 'package:isa_app/models/user_1.dart';

class HeartButton extends StatelessWidget {
  final ChatMessage chatMessage;
  final User1 currentUser;

  const HeartButton({
    @required this.chatMessage,
    @required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    bool isLiked = false;
    if (currentUser != null) {
      isLiked = chatMessage.likes.contains(currentUser.firebaseUser.uid);
    }

    return Row(
      children: [
        GestureDetector(
          child: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: currentUser != null
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColor.withOpacity(.3),
          ),
          onTap: () {
            if (currentUser == null || currentUser.firebaseUser.isAnonymous) {
              BotToast.showText(
                  text: 'Sign in as a non-anonymous user to like messages');
            } else {
              FieldValue likes = isLiked
                  ? FieldValue.arrayRemove([currentUser.firebaseUser.uid])
                  : FieldValue.arrayUnion([currentUser.firebaseUser.uid]);

              kChatChannelsRef
                  .doc(chatMessage.chatChannelId)
                  .collection('chat_messages')
                  .doc(chatMessage.id)
                  .update({'likes': likes});
            }
          },
        ),
        const SizedBox(width: kDefaultMargin/4,),
        Text('${chatMessage.likes.length}')
      ],
    );
  }
}