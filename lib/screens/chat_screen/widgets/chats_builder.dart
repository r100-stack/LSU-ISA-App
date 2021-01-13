import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/uid_name_cache.dart';
import 'package:isa_app/constants/firebase_constants.dart';
import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/models/chat_message.dart';
import 'package:provider/provider.dart';
import 'package:roipil_authentication/blocs/roipil_auth_bloc.dart';

import 'chat_message_card.dart';

class ChatsBuilder extends StatefulWidget {
  final ChatChannel chatChannel;
  final EdgeInsets padding;

  ChatsBuilder({this.chatChannel, this.padding});

  @override
  _ChatsBuilderState createState() => _ChatsBuilderState();
}

class _ChatsBuilderState extends State<ChatsBuilder> {
  List<ChatMessage> _chatMessages = [];

  void _listenToChatMessagesChanges() {
    UidNameCache uidNameCache =
        Provider.of<UidNameCache>(context, listen: false);

    kChatChannelsRef
        .doc(widget.chatChannel.id)
        .collection('chat_messages')
        .snapshots()
        .listen((QuerySnapshot snapshot) async {
      List<ChatMessage> newChatMessages = [];

      for (int i = 0; i < snapshot.docs.length; i++) {
        QueryDocumentSnapshot snap = snapshot.docs[i];
        ChatMessage chatMessage = ChatMessage.fromDocumentSnapshop(snap);
        chatMessage.name = await uidNameCache.getUserName(chatMessage.uid);

        newChatMessages.add(chatMessage);
      }

      setState(() {
        _chatMessages = newChatMessages;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listenToChatMessagesChanges();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: widget.padding,
      itemBuilder: (context, index) => ChatMessageCard(
        chatMessage: _chatMessages[index],
        currentUser: Provider.of<RoipilAuthBloc>(context)?.user,
      ),
      itemCount: _chatMessages.length,
    );

    //
    // TODO: DON'T REMOVE old commented out version.
    // Use this as a reference on how to use Rx.combineLatest2()
    //

    // return StreamBuilder(
    //   stream: Rx.combineLatest2(
    //       kChatChannelsRef.doc(chatChannelId).snapshots(),
    //       kChatChannelsRef
    //           .doc(chatChannelId)
    //           .collection('chat_messages')
    //           .orderBy('timestamp', descending: true)
    //           .snapshots(),
    //       (DocumentSnapshot chatChannelFirebase,
    //           QuerySnapshot chatMessagesFirebase) {
    //     ChatChannel chatChannel =
    //         ChatChannel.fromDocumentSnapshot(chatChannelFirebase);
    //     List<ChatMessage> chatMessages = chatMessagesFirebase.docs
    //         .map((chatMessageFirebase) =>
    //             ChatMessage.fromDocumentSnapshop(chatMessageFirebase))
    //         .toList();

    //     return {'chatChannel': chatChannel, 'chatMessages': chatMessages};
    //   }),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (snapshot.data == null) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     // ChatChannel chatChannel = snapshot.data['chatChannel'];
    //     List<ChatMessage> chatMessages = snapshot.data['chatMessages'];

    //     return ListView.builder(
    //       reverse: true,
    //       padding: padding,
    //       itemBuilder: (context, index) => ChatMessageCard(
    //         chatMessage: chatMessages[index],
    //         currentUser: Provider.of<RoipilAuthBloc>(context)?.user,
    //       ),
    //       itemCount: chatMessages.length,
    //     );
    //   },
    // );
  }
}
