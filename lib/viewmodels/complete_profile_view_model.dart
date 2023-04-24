

import 'package:flutter/material.dart';
import 'package:carisma/constants.dart';

class CompleteProfileViewModel extends ChangeNotifier {
  List<String> _errors = [];
  List<String> get errors => _errors;

  void _addError({required String error}) {
    if (!_errors.contains(error)) {
      _errors.contains(error);
    }
  }

  void _removeError({required String error}) {
    if (_errors.contains(error)) {
      _errors.remove(error);
    }
  }

  bool completeProfileInFirebase({
    required String name,
    required String account,
    required String phone,
    required String birthday,
    required String gender
  }) {

    if (name.isEmpty) {
      _addError(error: kNameNullError);
      return false;
    } else {
      _removeError(error: kNameNullError);
    }

    if (account.isEmpty) {
      _addError(error: kAccountNullError);
      return false;
    } else {
      _removeError(error: kAccountNullError);
    }

    if (phone.isEmpty) {
      _addError(error: kPhoneNumberNullError);
      return false;
    } else {
      _removeError(error: kPhoneNumberNullError);
    }

    if (birthday.isEmpty) {
      _addError(error: kBirthdayNullError);
      return false;
    } else {
      _removeError(error: kBirthdayNullError);
    }

    if (gender.isEmpty) {
      _addError(error: kGenderNullError);
      return false;
    } else {
      _removeError(error: kGenderNullError);
    }


    return true;
  }
}