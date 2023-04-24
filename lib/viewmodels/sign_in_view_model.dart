

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:carisma/share_preference_manager.dart';
import 'package:carisma/constants.dart';

class SignInViewModel extends ChangeNotifier {
  List<String> _errors = [];
  List<String> get errors => _errors;

  void _addError({required String error}) {
    if (!_errors.contains(error)) {
      _errors.add(error);
      notifyListeners();
    }
  }

  void _removeError({required String error}) {
    if (_errors.contains(error)) {
      _errors.remove(error);
      notifyListeners();
    }
  }

  Future<bool> signInWithFirebaseEmail({required String email, required String password}) async {

    if (email.isEmpty) {
      _addError(error: kEmailNullError);
      return Future.value(false);
    } else {
      _removeError(error: kEmailNullError);
    }

    if (password.isEmpty) {
      _addError(error: kPassNullError);
      return Future.value(false);
    } else {
      _removeError(error: kPassNullError);
    }

    _removeError(error: kEmailNotExistError);
    _removeError(error: kPasswordError);
    _removeError(error: kTooManyRequest);

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      await SharePreferenceManager.set(SharePreferenceKey.email, email);
      return Future.value(true);
    } on FirebaseException catch (e) {

      if (e.code == "user-not-found") {
        _addError(error: kEmailNotExistError);
      }

      if (e.code == "wrong-password") {
        _addError(error: kPasswordError);
      }

      if (e.code == "too-many-requests") {
        _addError(error: kTooManyRequest);
      }

    } catch (e) {
    }

    return Future.value(false);
  }
}