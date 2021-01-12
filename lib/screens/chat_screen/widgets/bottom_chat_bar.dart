import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/constants/dimension_constants.dart';
import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/models/chat_message.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:provider/provider.dart';
import 'package:roipil_authentication/blocs/roipil_auth_bloc.dart';

class BottomChatBar extends StatefulWidget {
  BottomChatBar({@required this.chatChannel});

  final TextEditingController controller = TextEditingController();

  final ChatChannel chatChannel;

  @override
  _BottomChatBarState createState() => _BottomChatBarState();
}

class _BottomChatBarState extends State<BottomChatBar> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    User1 user = Provider.of<RoipilAuthBloc>(context).user; // TODO: Should not be able to send messages if not signed in

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
              ? () async {
                  // User1 currentUser =
                  //     Provider.of<RoipilAuthBloc>(context, listen: false)?.user;
                  // if (currentUser == null) {
                  //   Scaffold.of(context).showSnackBar(
                  //       SnackBar(content: Text('Error sending message')));
                  //   return;
                  // }

                  // CollectionReference ref = widget._firestore
                  //     .collection('chat_channels')
                  //     .doc(widget.chatChannel.id)
                  //     .collection('chat_messages');
                  // ref.add({
                  //   'uid': currentUser.firebaseUser.uid,
                  //   'timestamp': Timestamp.fromMillisecondsSinceEpoch(
                  //       DateTime.now().millisecondsSinceEpoch),
                  //   'message': widget.controller.text,
                  //   'name': currentUser.name
                  // });

                  // widget.controller.clear();

                  bool sent = await widget.chatChannel.sendMessage(
                    ChatMessage(
                      uid: user.firebaseUser.uid,
                      chatChannelId: widget.chatChannel.id,
                      message: text,
                      timestamp: DateTime.now(),
                    ),
                  );
                  if (sent) {
                    widget.controller.clear();
                  }
                }
              : null,
        )
      ],
    );
  }
}
