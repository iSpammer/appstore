

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/message/body.dart';

class MessageScreen extends StatelessWidget {

  static String routeName = "/message_screen";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text('Message'),
          elevation: 3,
      ),
      body: Body(),
    );
  }
}