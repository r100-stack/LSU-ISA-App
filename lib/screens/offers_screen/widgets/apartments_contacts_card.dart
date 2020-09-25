import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/services/networking.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class ApartmentContactsCard extends StatelessWidget {
  final String title;
  final IconData leading;
  final String url;
  final Color textColor;
  final int maxLines;

  ApartmentContactsCard(
      {this.title, this.leading, this.url = '', this.textColor, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title ?? 'Not available',
        maxLines: maxLines ?? 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: textColor),
      ),
      leading: Icon(
        leading,
        color: textColor ?? Colors.blueGrey,
      ),
      trailing: Wrap(
        children: [
          ContactCardIcon(
              icon: Icons.copy,
              color: textColor,
              onTap: () {
                title != null
                    ? Clipboard.setData(ClipboardData(text: title))
                    : null;
                String snackBarText =
                    title != null ? 'Copied to clipboard' : 'No data to copy!';
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(snackBarText),
                  ),
                );
              }),
          SizedBox(
            width: kDefaultMargin / 2,
          ),
          ContactCardIcon(
            icon: Icons.open_in_new,
            color: textColor,
            onTap: () => Networking.launchUrl(context, url),
          ),
          // GestureDetector(
          //     child: Icon(
          //       Icons.open_in_new,
          //       color: textColor ?? Colors.blueGrey,
          //     ),
          //     onTap: () async {
          //       if (await canLaunch(url)) {
          //         launch(url);
          //       } else {
          //         print('Error launching the url: $url');
          //         Alert(context: context, title: 'Sorry, couldn\'t open that.')
          //             .show();
          //       }
          //     }),
        ],
      ),
    );
  }
}

class ContactCardIcon extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function onTap;

  const ContactCardIcon({this.color, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Icon(
          icon,
          color: color ?? Colors.blueGrey,
        ),
        onTap: onTap);
  }
}
