import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPassFormKey = GlobalKey<FormState>();
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController userPassCtrl = TextEditingController();
  TextEditingController regEmailCtrl = TextEditingController();
  TextEditingController regPassCtrl = TextEditingController();
  TextEditingController regConfirmPassCtrl = TextEditingController();
}
