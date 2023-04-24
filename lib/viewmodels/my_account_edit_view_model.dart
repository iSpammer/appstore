import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carisma/enums.dart';
import 'package:carisma/share_preference_manager.dart';

class MyAccountEditViewModel extends ChangeNotifier {


  Future<bool> setValueInFirebase({required AccountEditType type, required String value}) async {
    String email = await SharePreferenceManager.get(SharePreferenceKey.email);
    String key = "";

    switch (type) {
      case AccountEditType.name:
        // TODO: Handle this case.
        key = 'name';
        break;
      case AccountEditType.userAccount:
        // TODO: Handle this case.
        key = 'account';
        break;
      case AccountEditType.introduction:
        // TODO: Handle this case.
        key = 'introduction';
        break;
      case AccountEditType.gender:
        // TODO: Handle this case.
        key = 'gender';
        break;
      case AccountEditType.birthday:
        // TODO: Handle this case.
        key = 'birthday';
        break;
      case AccountEditType.cellphone:
        // TODO: Handle this case.
        key = 'phone';
        break;
      case AccountEditType.password:
        // TODO: Handle this case.
        key = '';
        break;
    }
    try {
      CollectionReference user = FirebaseFirestore.instance.collection('users');

      user.doc(email).update(
          {
            key: value
          }
      );
      return Future.value(true);

    } on FirebaseException catch (e) {

    }

    return Future.value(false);
  }
}