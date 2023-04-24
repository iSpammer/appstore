
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text("Sign Out"),
      content: Text("Sign Out of ..."),
      actions: [
        TextButton(
          onPressed: () {
            print("Yes");
          },
          child: Text("OK")
        ),
        TextButton(
          onPressed: () {
            print("Cancel");
          },
          child: Text("Cancel"))
      ],
    );
  }
}