import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';

class ValidatorService {
  bool validateAndSave(globalFormKey) {
    final FormState form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //<=============================================Mobile Number Validaor
  String? validatePassword(String? value) {
// Bangladeshi Mobile number are of 11 digit only

    if (value!.isEmpty) {
      return LocaleKeys.login_passwordRule1.tr();
    } else if (value.length < 6) {
      return LocaleKeys.login_passwordRule2.tr();
    }
    return null;
  }

//<=============================================== Email Validator
  String? validateEmail(String? value) {
    String? pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Enter Valid Email';
    }
    return null;
  }

  //<============================================== Name Validator
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.signUp_nameRule1.tr();
    } else if (value.length < 3) {
      return LocaleKeys.signUp_nameRule2.tr();
    }
    return null;
  }
}
