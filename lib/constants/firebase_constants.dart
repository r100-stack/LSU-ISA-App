import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final CollectionReference kUsersRef = _firestore.collection('users_isa_2');
final CollectionReference kRoipilUsersRef =
    _firestore.collection('roipil_users');
final CollectionReference kRoipilExtendedUsersRef =
    _firestore.collection('users_isa_2');

final CollectionReference kChatChannelsRef =
    _firestore.collection('chat_channels');
