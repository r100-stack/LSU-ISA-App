import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ChatMessage {
  String id;
  String uid;
  String chatChannelId;
  String message;
  // @Deprecated('Use the dynamic name using uid')
  String name;
  DateTime timestamp;

  ChatMessage({
    this.id,
    @required this.uid,
    @required this.chatChannelId,
    @required this.message,
    this.name,
    @required this.timestamp
  });

  factory ChatMessage.fromDocumentSnapshop(DocumentSnapshot chatMessageFirebase) {
    Timestamp t = chatMessageFirebase.data()['timestamp'];
    DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(t.millisecondsSinceEpoch);

    return ChatMessage(
      id: chatMessageFirebase.id,
      uid: chatMessageFirebase.data()['uid'],
      chatChannelId: chatMessageFirebase.data()['chatChannelId'],
      message: chatMessageFirebase.data()['message'],
      // name: chatMessageFirebase.data()['name'],
      timestamp: timestamp
    );
  }

  Map<String, dynamic> getFirebaseMap() {
    return {
      'uid': uid,
      'chatChannelId': chatChannelId,
      'message': message,
      'timestamp': Timestamp.fromDate(timestamp)
    };
  }
}
