

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/models/help_center_model.dart';
import 'package:carisma/screen/help_center/problem_webview_screen.dart';
import 'package:carisma/viewmodels/help_center_view_model.dart';
import 'package:provider/provider.dart';

class ProblemWidget extends StatefulWidget {
  @override
  _ProblemWidgetState createState() => _ProblemWidgetState();
}

class _ProblemWidgetState extends State<ProblemWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<HelpCenterViewModel>(context, listen: false).getHelpCenterModelInFirebase();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<HelpCenterViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            SizedBox(
                height: 50,
                child: Align(
                  child: Text("常見問題"),
                )
            ),
            Divider(color: Colors.grey,),
            for(var model in viewModel.helpCenterModel.helpCenters) _buildItem(model),
          ],
        );
      },
    );
  }

  Widget _buildItem(HelpCenter model) {
    return SizedBox(
      height: 50,

      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pushNamed(context, ProblemWebViewScreen.routeName, arguments: model);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(model.title),
            ),
            Spacer(),
            Divider(color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}