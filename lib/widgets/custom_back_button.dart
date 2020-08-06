import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //       offset: Offset(0, 0),
            //       color: Color(0xFF3D3D3D).withOpacity(.2),
            //       blurRadius: 10)
            // ],
          ),
          child: BackButton(color: Theme.of(context).accentColor)),
    );
  }
}
