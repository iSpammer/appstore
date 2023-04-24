

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/help_center/categories_widget.dart';
import 'package:carisma/screen/help_center/problem_widget.dart';
import 'package:carisma/viewmodels/help_center_view_model.dart';
import 'package:provider/provider.dart';


class HelpCenterScreen extends StatelessWidget {

  static String routeName = "/help_center";

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HelpCenterViewModel();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Help Center"),
          elevation: 3,
        ),

        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Divider(color: Colors.grey),

                ProblemWidget(),

                Divider(color: Colors.grey),

                CategoriesWidget(),

                Divider(color: Colors.grey),

                SizedBox(
                    height: 50,
                    child: Align(
                      child: Text("聯絡我們"),
                    )
                ),

                Divider(color: Colors.grey),

                // TODO: Contact us
              ],
            ),
          )
        )
      ),
    );
  }
}