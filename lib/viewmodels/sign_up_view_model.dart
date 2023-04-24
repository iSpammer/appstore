
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carisma/constants.dart';
import 'package:carisma/share_preference_manager.dart';

class SignUpViewModel extends ChangeNotifier {

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

  Future<bool> registrationWithEmail({
    required String email,
    required String password,
    required String confirmPassword }) async {

    _removeError(error: kEmailAlreadyInUse);
    
    if (!_validEmail(email: email)) {
      return Future.value(false);
    }

    if (!_validPassword(password: password, confirmPassword: confirmPassword)) {
      return Future.value(false);
    }

    try {
      // Add User in Auth
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      
      // Add email in FireStore Database
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      // Set in UserDefault
      await SharePreferenceManager.set(SharePreferenceKey.email, email);

      await users.doc(email).set(
          {
            'account': '',
            'backgroundImage': '',
            'birthday': '',
            'email': email,
            'gender': '',
            'introduction': '',
            'name': '',
            'phone': '',
            'profileImage': ''
          }
      );
      return Future.value(true);
    } on FirebaseException catch (e) {
      if (e.code == "email-already-in-use") {
        _addError(error: kEmailAlreadyInUse);
      }
      print(e.code);
      // catch error
    } catch (e) {
      // catch error
    }
    return Future.value(false);
  }

  bool _validEmail({required String email}) {
    if (email.isEmpty) {
      _addError(error: kEmailNullError);
      return false;
    } else {
      _removeError(error: kEmailNullError);
      if (!emailValidatorRegExp.hasMatch(email)) {
        _addError(error: kInvalidEmailError);
        return false;
      } else {
        _removeError(error: kInvalidEmailError);
      }
    }
    return true;
  }

  bool _validPassword({required String password, required String confirmPassword}) {
    if (password.isEmpty) {
      _addError(error: kPassNullError);
      return false;
    } else {
      _removeError(error: kPassNullError);
      if (password.length < 8) {
        _addError(error: kShortPassError);
        return false;
      } else {
        _removeError(error: kShortPassError);
        if (password != confirmPassword) {
          _addError(error: kMatchPassError);
          return false;
        }
        else {
          _removeError(error: kMatchPassError);
        }
      }
    }
    return true;
  }
}