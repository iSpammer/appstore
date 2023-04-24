
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/forgot_password/body.dart';

class ForgotPasswordScreen extends StatelessWidget {

  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Body(),
    );
  }
}