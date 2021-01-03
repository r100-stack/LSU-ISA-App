import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  String id;
  String uid;
  String chatChannelId;
  String message;
  String name;
  DateTime timestamp;

  ChatMessage({
    this.id,
    this.uid,
    this.chatChannelId,
    this.message,
    this.name,
    this.timestamp
  });

  factory ChatMessage.fromDocumentSnapshop(DocumentSnapshot chatMessageFirebase) {
    Timestamp t = chatMessageFirebase.data()['timestamp'];
    DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(t.millisecondsSinceEpoch);

    return ChatMessage(
      id: chatMessageFirebase.id,
      uid: chatMessageFirebase.data()['uid'],
      chatChannelId: chatMessageFirebase.data()['chatChannelId'],
      message: chatMessageFirebase.data()['message'],
      name: chatMessageFirebase.data()['name'],
      timestamp: timestamp
    );
  }
}
