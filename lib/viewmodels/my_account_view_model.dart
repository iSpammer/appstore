

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:carisma/models/my_account.dart';

import '../share_preference_manager.dart';

class MyAccountViewModel extends ChangeNotifier {

  MyAccount? _myAccount;
  MyAccount? get myAccount => _myAccount;
  
  void getMyAccountInfoInFirebase() async {

    String email = await SharePreferenceManager.get(SharePreferenceKey.email) ?? "";

    FirebaseFirestore.instance.collection('users').doc(email).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic>? jsonData = documentSnapshot.data() as Map<String, dynamic>?;
        _myAccount = MyAccount.fromJson(jsonData!);

        if ((_myAccount?.profileImage ?? "").isNotEmpty) {
          FirebaseStorage.instance.ref(_myAccount?.profileImage ?? "").getDownloadURL().then((String url) {
            _myAccount!.profileImage = url;
            notifyListeners();
          });
        }

        notifyListeners();
      } else {
        print('failed');
      }
    });
  }

  void setGenderInFirebase({required String value}) async {

    String email = await SharePreferenceManager.get(SharePreferenceKey.email);

    try {
      CollectionReference user = FirebaseFirestore.instance.collection('users');

      user.doc(email).update(
        {
          'gender': value
        }
      );
      getMyAccountInfoInFirebase(); // reload
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }

  void setBirthdayInFirebase({required String value}) async{
    String email = await SharePreferenceManager.get(SharePreferenceKey.email);

    try {
      CollectionReference user = FirebaseFirestore.instance.collection('users');

      user.doc(email).update(
        {
          'birthday': value
        }
      );
      getMyAccountInfoInFirebase(); // reload
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }
}