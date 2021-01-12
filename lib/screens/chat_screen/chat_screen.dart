import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/auth_bloc.dart';
import 'package:isa_app/constants.dart';

import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/models/chat_message.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:isa_app/screens/chat_screen/widgets/bottom_chat_bar.dart';
import 'package:isa_app/screens/chat_screen/widgets/chat_message_card.dart';
import 'package:isa_app/screens/chat_screen/widgets/chats_builder.dart';
import 'package:provider/provider.dart';
import 'package:roipil_authentication/blocs/roipil_auth_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ChatScreen extends StatelessWidget {
  static final String routeName = '/chat';

  final String chatChannelId;

  ChatScreen({
    this.chatChannelId,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder( // TODO: Modulatize the StreamBuilder
      stream: Rx.combineLatest2(
          kChatChannelsRef.doc(chatChannelId).snapshots(),
          kChatChannelsRef
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
          return Center(child: CircularProgressIndicator()); // TODO: Returns an appBar with the backbutton in case the screen takes too long to load.
        }

        ChatChannel chatChannel = snapshot.data['chatChannel'];
        List<ChatMessage> chatMessages = snapshot.data['chatMessages'];

        String currentUserName =
            Provider.of<RoipilAuthBloc>(context)?.user?.name;
        currentUserName == null || currentUserName.length == 0
            ? currentUserName = 'LSU Tiger'
            : null; // TODO: null -> Not signed in

        return Scaffold(
          appBar: AppBar(
            title: Text(chatChannel.name),
          ),
          body: Column(
            children: [
              Container(
                color: kAccentColorLight,
                height: 50.0,
                child: ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Signed in as $currentUserName.'),
                ),
              ),
              Expanded(
                // child: ChatsBuilder(
                // padding: const EdgeInsets.symmetric(
                //   horizontal: kDefaultMargin / 2,
                //   vertical: kDefaultMargin / 4,
                // ),
                //   chatChannelId: chatChannel.id,
                // ),
                child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultMargin / 2,
                    vertical: kDefaultMargin / 4,
                  ),
                  itemBuilder: (context, index) => ChatMessageCard(
                    chatMessage: chatMessages[index],
                    currentUser: Provider.of<RoipilAuthBloc>(context)?.user,
                  ),
                  itemCount: chatMessages.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultMargin / 2,
                    vertical: kDefaultMargin / 2),
                child: BottomChatBar(chatChannel: chatChannel,),
              )
            ],
          ),
        );
      },
    );
  }
}



class _RealTimeChatChannelNameTextWidget extends StatelessWidget {
  const _RealTimeChatChannelNameTextWidget({
    Key key,
    @required this.currentChatChannel,
  }) : super(key: key);

  final ChatChannel currentChatChannel;

  @override
  Widget build(BuildContext context) {
    return Text(currentChatChannel.name);
  }
}
