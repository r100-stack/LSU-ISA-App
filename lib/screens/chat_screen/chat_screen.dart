import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/auth_bloc.dart';
import 'package:isa_app/constants.dart';

import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:isa_app/screens/chat_screen/widgets/chats_builder.dart';
import 'package:provider/provider.dart';
import 'package:roipil_authentication/blocs/roipil_auth_bloc.dart';

class ChatScreen extends StatelessWidget {
  static final String routeName = '/chat';

  final ChatChannel chatChannel;

  ChatScreen({
    this.chatChannel,
  });

  //  void signInAnomously(BuildContext context) async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //   AuthResult authResult = await _auth.signInAnonymously();
  //   FirebaseUser user = authResult.user;
  //   User1 user1 = User1(uid: user.uid, isAnonymous: true);

  //   print(user1.uid);
  // }

  @override
  Widget build(BuildContext context) {
    String currentUserName = Provider.of<RoipilAuthBloc>(context)?.user?.name;
    currentUserName == null || currentUserName.length == 0
        ? currentUserName = 'LSU Tiger'
        : null;

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
            child: ChatsBuilder(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultMargin / 2,
                vertical: kDefaultMargin / 4,
              ),
              chatChannelId: chatChannel.id,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultMargin / 2, vertical: kDefaultMargin / 2),
            child: BottomChatBar(chatChannel: chatChannel),
          )
        ],
      ),
    );
  }
}

class BottomChatBar extends StatefulWidget {
  BottomChatBar({
    Key key,
    @required this.chatChannel,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ChatChannel chatChannel;

  @override
  _BottomChatBarState createState() => _BottomChatBarState();
}

class _BottomChatBarState extends State<BottomChatBar> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            cursorColor: Theme.of(context).primaryColor,
            decoration: new InputDecoration(
              hintText: 'Your message...',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: kDefaultMargin / 2),
            ),
            controller: widget.controller,
            onChanged: (String newText) {
              text = newText;
              setState(() {});
            },
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.send,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: text != null && text.length != 0
              ? () {
                  User1 currentUser =
                      Provider.of<RoipilAuthBloc>(context, listen: false)?.user;
                  if (currentUser == null) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Error sending message')));
                    return;
                  }

                  CollectionReference ref = widget._firestore
                      .collection('chat_channels')
                      .doc(widget.chatChannel.id)
                      .collection('chat_messages');
                  ref.add({
                    'uid': currentUser.firebaseUser.uid,
                    'timestamp': Timestamp.fromMillisecondsSinceEpoch(
                        DateTime.now().millisecondsSinceEpoch),
                    'message': widget.controller.text,
                    'name': currentUser.name
                  });

                  widget.controller.clear();
                }
              : null,
        )
      ],
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
