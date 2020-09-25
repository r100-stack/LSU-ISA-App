import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/models/chat_message.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'chat_message_card.dart';

class ChatsBuilder extends StatelessWidget {
  final String chatChannelId;

  final Firestore _firestore = Firestore.instance;

  ChatsBuilder({
    this.chatChannelId,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Rx.combineLatest2(
          _firestore
              .collection('chat_channels')
              .document(chatChannelId)
              .snapshots(),
          _firestore
              .collection('chat_channels')
              .document(chatChannelId)
              .collection('chat_messages')
              .snapshots(),
          (DocumentSnapshot chatChannelFirebase,
              QuerySnapshot chatMessagesFirebase) {
        ChatChannel chatChannel =
            ChatChannel.fromDocumentSnapshot(chatChannelFirebase);
        List<ChatMessage> chatMessages = chatMessagesFirebase.documents
            .map((chatMessageFirebase) =>
                ChatMessage.fromDocumentSnapshop(chatMessageFirebase))
            .toList();

        return {'chatChannel': chatChannel, 'chatMessages': chatMessages};
      }),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        // ChatChannel chatChannel = snapshot.data['chatChannel'];
        List<ChatMessage> chatMessages = snapshot.data['chatMessages'];

        return ListView.builder(
          itemBuilder: (context, index) => ChatMessageCard(
            chatMessage: chatMessages[index],
          ),
          itemCount: chatMessages.length,
        );
      },
    );
  }
}
