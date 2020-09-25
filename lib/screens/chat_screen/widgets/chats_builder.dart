import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/models/chat_message.dart';
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
        // if (!snapshot.hasData) {
        //   return Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }

        // print(snapshot);
        // print(snapshot.runtimeType);
        // print(snapshot.data);
        // print(snapshot.data.runtimeType);
        // print(snapshot.data.documents);
        // print(snapshot.data.documents.runtimeType);

        // Map<String, dynamic> snapshotMap = snapshot.data;
        // DocumentSnapshot chatChannelFirebase =
        //     snapshotMap['chatChannelFirebase'];
        // QuerySnapshot chatFirebase = snapshotMap['chatFirebase'];

        ChatChannel chatChannel = snapshot.data['chatChannel'];
        List<ChatMessage> chatMessages = snapshot.data['chatMessages'];

        print('START');
        print(chatChannel);
        print(chatMessages);
        print('END');

        // return Text('Sample');

        // list.forEach((key, value) {
        //     DocumentSnapshot chatChannelFirebase = ['chatChannelFirebase'];
        //   QuerySnapshot chatFirebase = l.data['chatFirebase'];
        // });

        // for (dynamic l in list) {
        //   DocumentSnapshot chatChannelFirebase = l.data['chatChannelFirebase'];
        //   QuerySnapshot chatFirebase = l.data['chatFirebase'];

        //   // print(chatChannelFirebase.)

        //   // Map<String, dynamic> obj = l.data;
        //   // obj.map((key, value) {
        //   //   print('key = $key, value = $value');
        //   // });
        // }

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
