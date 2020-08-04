import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class ApartmentContactsCard extends StatelessWidget {
  final String title;
  final IconData leading;
  final String url;

  ApartmentContactsCard({this.title = '', this.leading, this.url = ''});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(
        leading,
        color: Colors.blueGrey,
      ),
      trailing: GestureDetector(
          child: Icon(
            Icons.open_in_new,
            color: Colors.blueGrey,
          ),
          onTap: () async {
            if (await canLaunch(url)) {
              launch(url);
            } else {
              print('Error launching the url: $url');
              Alert(context: context, title: 'Sorry, couldn\'t open that.')
                  .show();
            }
          }),
    );
  }
}
