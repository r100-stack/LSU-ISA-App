import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/screens/chat_home/widgets/chat_channel_card.dart';

class ChatChannelsBuilder extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('chat_channels').snapshots(), // TODO: Keep this in firebase_constants.dart
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<DocumentSnapshot> chatChannelsFirebase =
            snapshot.data.docs;
        List<ChatChannel> chatChannels = chatChannelsFirebase
            .map((chatChannelFirebase) =>
                ChatChannel.fromDocumentSnapshot(chatChannelFirebase))
            .toList();

        return ListView.builder(
          itemBuilder: (context, index) => ChatChannelCard(
            chatChannel: chatChannels[index],
          ),
          itemCount: chatChannels.length,
        );
      },
    );
  }
}
