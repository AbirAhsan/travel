import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SharedDataManageService {
  final box = GetStorage();

//<======================================== Token Functionality
  Future<void> setToken(String token) async {
    box.write('token', token);
  }

  Future<String?> getToken() async {
    String? token = box.read('token') ?? "";

    return token;
  }

  Future<void> removeToken() async {
    box.remove('token');
    box.remove("userType");
    debugPrint("Token and UserType removed");
  }

//<=========================================== OnBoard Functionality
  Future<void> setOnBoard(String onBoard) async {
    box.write('onboardToken', onBoard);
  }

  Future<bool> getOnBoard() async {
    String onboardToken = box.read(
          "onboardToken",
        ) ??
        "0";
    return onboardToken == "1" ? true : false;
  }

  //<========================================= User Type Functionality
  Future<void> setUserType(String user) async {
    box.write('userType', user);
  }

  Future<String?> getUserType() async {
    String? userType = box.read('userType') ?? "";

    return userType;
  }
}
