import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/auth_bloc.dart';
import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/models/chat_message.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:provider/provider.dart';
import 'package:roipil_authentication/blocs/roipil_auth_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'chat_message_card.dart';

class ChatsBuilder extends StatelessWidget {
  final String chatChannelId;
  final EdgeInsets padding;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ChatsBuilder({this.chatChannelId, this.padding});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Rx.combineLatest2(
          _firestore
              .collection('chat_channels')
              .doc(chatChannelId)
              .snapshots(),
          _firestore
              .collection('chat_channels')
              .doc(chatChannelId)
              .collection('chat_messages')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          (DocumentSnapshot chatChannelFirebase,
              QuerySnapshot chatMessagesFirebase) {
        ChatChannel chatChannel =
            ChatChannel.fromDocumentSnapshot(chatChannelFirebase);
        List<ChatMessage> chatMessages = chatMessagesFirebase.docs
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
          reverse: true,
          padding: padding,
          itemBuilder: (context, index) => ChatMessageCard(
            chatMessage: chatMessages[index],
            currentUser: Provider.of<RoipilAuthBloc>(context)?.user,
          ),
          itemCount: chatMessages.length,
        );
      },
    );
  }
}

// TODO: Make the channel chat name on the chat_screen real time.
