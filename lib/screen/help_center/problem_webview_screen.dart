

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/models/help_center_model.dart';

class ProblemWebViewScreen extends StatelessWidget {

  static String routeName = "/problem_web_view";

  @override
  Widget build(BuildContext context) {

    HelpCenter? _model = ModalRoute.of(context)?.settings.arguments as HelpCenter;

    return Scaffold(
      appBar: AppBar(
        title: Text(_model.title),
      ),
      body: Container(
        child: Text("Webview"),
        // child: WebView(
        //   // URL
        //   initialUrl: _model.clickThrough,
        //   javascriptMode: JavascriptMode.unrestricted,
        // ),
      ),
    );
  }
}