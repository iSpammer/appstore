

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/sign_up/body.dart';
import 'package:carisma/viewmodels/sign_up_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SignUpViewModel();
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text("Sign Up")
        ),
        body: Body(),
      ) ,
    );
  }
}