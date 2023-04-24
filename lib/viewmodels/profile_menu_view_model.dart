
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:carisma/share_preference_manager.dart';

class ProfileMenuViewModel extends ChangeNotifier {

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    SharePreferenceManager.removeAll();
  }
}