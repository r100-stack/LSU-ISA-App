import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  String id;
  String chatChannelId;
  String message;
  String name;
  String email;

  ChatMessage({
    this.id,
    this.chatChannelId,
    this.message,
    this.name,
    this.email,
  });

  factory ChatMessage.fromDocumentSnapshop(DocumentSnapshot chatMessageFirebase) {
    return ChatMessage(
      id: chatMessageFirebase.documentID,
      chatChannelId: chatMessageFirebase.data['chatChannelId'],
      message: chatMessageFirebase.data['message'],
      name: chatMessageFirebase.data['name'],
      email: chatMessageFirebase.data['email']
    );
  }
}
