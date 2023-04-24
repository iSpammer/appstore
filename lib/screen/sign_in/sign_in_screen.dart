
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/sign_in/body.dart';
import 'package:carisma/viewmodels/sign_in_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SignInViewModel();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign in'),
        ),
        body: Body(),
      ),
    );
  }
}