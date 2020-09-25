import 'package:cloud_firestore/cloud_firestore.dart';

class ChatChannel {
  String id;
  String name;
  String description;

  ChatChannel({
    this.id,
    this.name,
    this.description,
  });

  factory ChatChannel.fromDocumentSnapshot(
      DocumentSnapshot chatChannelFirebase) {
    return ChatChannel(
      id: chatChannelFirebase.documentID,
      name: chatChannelFirebase.data['name'],
      description: chatChannelFirebase.data['description'],
    );
  }
}
