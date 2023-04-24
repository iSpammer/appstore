
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/enums.dart';
import 'package:carisma/viewmodels/my_account_edit_view_model.dart';
import 'package:provider/provider.dart';

typedef VoidCallback = void Function();

// ignore: must_be_immutable
class MyAccountEditScreen extends StatefulWidget {

  // Ref: https://medium.com/flutterdevs/working-with-callback-in-flutter-89dc207cba37
  AccountEditType type;
  VoidCallback callback;
  MyAccountEditScreen(this.callback, {required this.type});


  @override
  _MyAccountEditScreenState createState() => _MyAccountEditScreenState(type: type);
}

class _MyAccountEditScreenState extends State<MyAccountEditScreen> {
  String changeValue = "";
  AccountEditType type;

  Text _getTitle() {

    String title = "Edit";
    switch (type){
      case AccountEditType.name:
        // TODO: Handle this case.
        title = "Edit Name";
        break;
      case AccountEditType.userAccount:
        // TODO: Handle this case.
        title = "Edit Account";
        break;
      case AccountEditType.introduction:
        // TODO: Handle this case.
        title = "Edit Introduction";
        break;
      case AccountEditType.gender:
        // TODO: Handle this case.
        title = "Edit Gender";
        break;
      case AccountEditType.cellphone:
        // TODO: Handle this case.
        title = "Edit Cellphone";
        break;
      case AccountEditType.password:
        // TODO: Handle this case.
        title = "Edit Password";
        break;
      case AccountEditType.birthday:
      // TODO: Handle this case.
        title = "Edit Birthday";
        break;
    }

    return Text(title);
  }

  _MyAccountEditScreenState({required this.type});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return MyAccountEditViewModel();
      },
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: _getTitle(),
          actions: [
            IconButton(
              onPressed: () {
                var viewModel = MyAccountEditViewModel();
                viewModel.setValueInFirebase(type: type, value: changeValue).then(
                        (success) {
                          if (success) {
                            widget.callback();
                            Navigator.pop(context);
                          }
                        }
                );
              },
              icon: Icon(Icons.save)
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              height: 50,
              color: Colors.white,
              child: TextField(
                onChanged: (value) {
                  changeValue = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 15, 5, 5),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(0)
                    ),
                    borderSide: BorderSide(
                        color: Colors.black
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(0)
                    ),
                    borderSide: BorderSide(
                        color: Colors.black
                    )
                  ),
                )
              ),
            )
          ),
        ),
      ),
    );
  }
}