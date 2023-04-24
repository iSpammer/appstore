

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:carisma/models/my_list_model.dart';
import 'package:carisma/share_preference_manager.dart';

import '../models/product.dart';

class MyListViewModel extends ChangeNotifier {

  Product? _myListModel;
  Product? get myListModel => _myListModel;

  void getMyListInFirebase() async {
    String email = await SharePreferenceManager.get(SharePreferenceKey.email);

    FirebaseFirestore.instance.collection('mylist').doc(email).get().then((DocumentSnapshot documentSnapshot) {
      print("Doing FirebaseFirestore");

      if (documentSnapshot.exists) {
        Map<String, dynamic> jsonData = documentSnapshot.data() as Map<String, dynamic>;
        _myListModel = Product.fromMap(jsonData);
        notifyListeners();
        print(jsonData);
      }

    });
  }
}