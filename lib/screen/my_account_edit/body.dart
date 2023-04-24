
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/viewmodels/my_account_edit_view_model.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var viewModel = Provider.of<MyAccountEditViewModel>(context);

    return Container();
  }
}