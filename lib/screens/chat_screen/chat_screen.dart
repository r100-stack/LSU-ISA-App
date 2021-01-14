import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

import 'package:isa_app/models/chat_channel.dart';
import 'package:isa_app/models/user_1.dart';
import 'package:isa_app/screens/chat_screen/widgets/bottom_chat_bar.dart';
import 'package:isa_app/screens/chat_screen/widgets/chats_builder.dart';
import 'package:isa_app/utils/auth_utils.dart';
import 'package:provider/provider.dart';
import 'package:roipil_authentication/blocs/roipil_auth_bloc.dart';
import 'package:roipil_authentication/services/roipil_auth_service.dart';

class ChatScreen extends StatelessWidget {
  static final String routeName = '/chat';

  final ChatChannel chatChannel;

  ChatScreen({
    this.chatChannel,
  });

  String _getSignedInAsText(User1 user) {
    if (user == null) {
      return 'Not signed in';
    } else {
      return 'Signed in as ${user.name}'; // TODO: Handle when user.name == null because anonymous
    }
  }

  @override
  Widget build(BuildContext context) {
    User1 user = Provider.of<RoipilAuthBloc>(context).user;

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
              title: Text(_getSignedInAsText(user)),
              trailing: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                ),
                child: Text('Change'),
                onPressed: () {
                  User1 user = Provider.of<RoipilAuthBloc>(context, listen: false).user;
                  AuthUtils.showCorrectAuthenticationAlert(context, user);
                },
              ),
            ),
          ),
          Expanded(
            child: ChatsBuilder(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultMargin / 2,
                vertical: kDefaultMargin / 4,
              ),
              chatChannel: chatChannel,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultMargin / 2, vertical: kDefaultMargin / 2),
            child: BottomChatBar(
              chatChannel: chatChannel,
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
