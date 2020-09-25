import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/blocs/auth_bloc.dart';
import 'package:isa_app/constants.dart';

import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/screens/chat_screen/widgets/chats_builder.dart';
import 'package:isa_app/screens/user_modify_details_screen/user_modify_details_screen.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  static final String routeName = '/chat';

  final ChatChannel chatChannel;

  ChatScreen({
    this.chatChannel,
  });

  @override
  Widget build(BuildContext context) {
    String currentUserName = Provider.of<AuthBloc>(context).currentUser.name;

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
              trailing: FlatButton(
                  child: Text('Change'),
                  onPressed: () => Navigator.pushNamed(
                      context, UserModifyDetailsScreen.routeName)),
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
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: new InputDecoration(
                      hintText: 'Your message...',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: kDefaultMargin / 2),
                    ),
                    controller: TextEditingController(),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => null,
                )
              ],
            ),
          )
        ],
      ),
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
