import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:isa_app/constants/firebase_constants.dart';
import 'package:isa_app/models/user_1.dart';

class ChatMessage {
  String id;
  String uid;
  String chatChannelId;
  String message;
  // @Deprecated('Use the dynamic name using uid')
  String name;
  List<String> likes;
  Deleted deleted;
  DateTime timestamp;

  ChatMessage(
      {this.id,
      @required this.uid,
      @required this.chatChannelId,
      @required this.message,
      this.name,
      this.likes,
      this.deleted,
      @required this.timestamp});

  factory ChatMessage.fromDocumentSnapshop(
      DocumentSnapshot chatMessageFirebase) {
    Timestamp t = chatMessageFirebase.data()['timestamp'];
    DateTime timestamp =
        DateTime.fromMillisecondsSinceEpoch(t.millisecondsSinceEpoch);

    return ChatMessage(
      id: chatMessageFirebase.id,
      uid: chatMessageFirebase.data()['uid'],
      chatChannelId: chatMessageFirebase.data()['chatChannelId'],
      message: chatMessageFirebase.data()['message'],
      // name: chatMessageFirebase.data()['name'],
      likes: List.from(chatMessageFirebase.data()['likes'] ?? []),
      deleted:
          Deleted.fromDocumentSnapshot(chatMessageFirebase.data()['deleted']),
      timestamp: timestamp,
    );
  }

  // TODO: Noticed that chatChannelId is being saved along with the message. This is redundant.
  Map<String, dynamic> getFirebaseMap() {
    return {
      'uid': uid,
      'chatChannelId': chatChannelId,
      'message': message,
      'timestamp': Timestamp.fromDate(timestamp)
    };
  }

  Future<void> delete(User1 currentUser) async {
    kChatChannelsRef
        .doc(chatChannelId)
        .collection('chat_messages')
        .doc(id)
        .update({
      'deleted': {
        'uid': currentUser.firebaseUser.uid,
        'timestamp': Timestamp.now()
      }
    });
  }
}

class Deleted {
  String uid;
  DateTime timestamp;

  Deleted({
    this.uid,
    this.timestamp,
  });

  factory Deleted.fromDocumentSnapshot(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    Timestamp t = map['timestamp'];
    DateTime timestamp =
        DateTime.fromMillisecondsSinceEpoch(t.millisecondsSinceEpoch);

    return Deleted(
      uid: map['uid'],
      timestamp: timestamp,
    );
  }
}
