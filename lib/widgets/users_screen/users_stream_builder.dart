import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isa_app/models/user.dart';
import 'package:isa_app/widgets/custom_progress_indicator.dart';
import 'package:isa_app/widgets/users_screen/user_card.dart';

class UsersStreamBuilder extends StatelessWidget {
  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = (width/500).floor();
    crossAxisCount < 1 ? crossAxisCount = 1 : null;

    return StreamBuilder(
      stream: _firestore.collection('users_isa').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CustomProgressIndicator();
        }

        final usersFirebase = snapshot.data.documents;
        List<User> users = [];
        for (var user in usersFirebase) {
          users.add(User(
              name: user['name'],
              tagline: user['tagline'],
              description: user['description'],
              profileImageUrl: user['images']['profile'],
              bannerImageUrl: user['images']['banner'],
              email: user['contact']['email'],
              phoneNumber: user['contact']['phone_number'],
              facebookLink: user['links']['facebook'],
              instagramLink: user['links']['instagram'],
              websiteLink: user['links']['website']));
          users.add(User(
              name: user['name'],
              tagline: user['tagline'],
              description: user['description'],
              profileImageUrl: user['images']['profile'],
              bannerImageUrl: user['images']['banner'],
              email: user['contact']['email'],
              phoneNumber: user['contact']['phone_number'],
              facebookLink: user['links']['facebook'],
              instagramLink: user['links']['instagram'],
              websiteLink: user['links']['website']));
          users.add(User(
              name: user['name'],
              tagline: user['tagline'],
              description: user['description'],
              profileImageUrl: user['images']['profile'],
              bannerImageUrl: user['images']['banner'],
              email: user['contact']['email'],
              phoneNumber: user['contact']['phone_number'],
              facebookLink: user['links']['facebook'],
              instagramLink: user['links']['instagram'],
              websiteLink: user['links']['website']));
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 820/312,
            crossAxisCount: crossAxisCount
          ),
          itemBuilder: (context, index) {
            return UserCard(users[index]);
          },
          itemCount: users.length,
        );
      },
    );
  }
}
