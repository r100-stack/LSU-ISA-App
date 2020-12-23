import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/services/networking.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class ApartmentContactsCard extends StatelessWidget {
  final String title;
  final IconData leading;
  final String copy;
  final String url;
  final Color textColor;
  final int maxLines;

  final bool copyIsUrl;
  final bool copyIsTitle;

  ApartmentContactsCard(
      {this.title,
      this.leading,
      this.copy,
      this.url,
      this.textColor,
      this.maxLines,
      this.copyIsUrl = false,
      this.copyIsTitle = false})
      : assert((copyIsTitle & copyIsUrl == false)),
        assert(copy != null ? (!copyIsUrl | !copyIsTitle) : true);

  @override
  Widget build(BuildContext context) {
    String copyString = copy;
    if (copyString == null) {
      if (copyIsUrl) {
        copyString = url;
      } else if (copyIsTitle) {
        copyString = title;
      }
    }

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
      trailing: CopyAndRedirectIconSet(
        copy: copyString,
        url: url,
      ),
    );
  }
}

class CopyAndRedirectIconSet extends StatelessWidget {
  final Color textColor;
  final String copy;
  final String url;

  const CopyAndRedirectIconSet({this.textColor, this.copy, this.url});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: []
        ..add(copy != null
            ? ContactCardIcon(
                icon: Icons.copy,
                color: textColor,
                onTap: () {
                  copy != null
                      ? Clipboard.setData(ClipboardData(text: copy))
                      : null;
                  String snackBarText =
                      copy != null ? 'Copied to clipboard' : 'No data to copy!';
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(snackBarText),
                    ),
                  );
                })
            : const SizedBox.shrink())
        ..add(copy != null && url != null
            ? SizedBox(
                width: kDefaultMargin / 2,
              )
            : const SizedBox.shrink())
        ..add(
          url != null
              ? ContactCardIcon(
                  icon: Icons.open_in_new,
                  color: textColor,
                  onTap: () => Networking.launchUrl(context, url),
                )
              : const SizedBox.shrink(),
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
