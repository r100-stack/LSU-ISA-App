import 'package:cloud_firestore/cloud_firestore.dart';

enum CHAT_CHANNEL_TYPE { SIGN_IN, ANONYMOUS, SIGN_IN_OR_ANONYMOUS }

class ChatChannel {
  String id;
  String name;
  String description;
  String imageUrl;
  CHAT_CHANNEL_TYPE type;

  ChatChannel({this.id, this.name, this.description, this.imageUrl, this.type});

  factory ChatChannel.fromDocumentSnapshot(
      DocumentSnapshot chatChannelFirebase) {
    CHAT_CHANNEL_TYPE type;
    String typeString = chatChannelFirebase['type'];
    switch (typeString) {
      case 'sign_in':
        type = CHAT_CHANNEL_TYPE.SIGN_IN;
        break;
      case 'anonymous':
        type = CHAT_CHANNEL_TYPE.ANONYMOUS;
        break;
      case 'sign_in_or_anonymous':
      default:
        type = CHAT_CHANNEL_TYPE.SIGN_IN_OR_ANONYMOUS;
    }

    return ChatChannel(
      id: chatChannelFirebase.id,
      name: chatChannelFirebase.data()['name'],
      description: chatChannelFirebase.data()['description'],
      imageUrl: chatChannelFirebase.data()['imageUrl'],
      type: type,
    );
  }
}
