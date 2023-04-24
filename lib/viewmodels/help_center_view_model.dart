

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carisma/models/help_center_model.dart';

class HelpCenterViewModel extends ChangeNotifier {

  HelpCentersModel _helpCenterModel = HelpCentersModel.empty();
  HelpCentersModel get helpCenterModel => _helpCenterModel;
  
  void getHelpCenterModelInFirebase() {
    FirebaseFirestore.instance.collection('menu').doc('help_center').get().then((DocumentSnapshot documentSnap) {
      if (documentSnap.exists) {
        Map<String, dynamic>? json = documentSnap.data() as Map<String, dynamic>?;
        if (json != null){
          _helpCenterModel = HelpCentersModel.fromJson(json);
          notifyListeners();
        }
      }
    });
  }
}