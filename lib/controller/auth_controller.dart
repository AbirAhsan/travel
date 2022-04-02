import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../services/api_error_handle_service.dart';
import '../services/custom_eassy_loading.dart';
import '../services/validator_service.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPassFormKey = GlobalKey<FormState>();
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController userPassCtrl = TextEditingController();
  TextEditingController regEmailCtrl = TextEditingController();
  TextEditingController regPassCtrl = TextEditingController();
  TextEditingController regConfirmPassCtrl = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //<<====================================== Try To Login
  void tryToLogin() async {
    if (ValidatorService().validateAndSave(loginFormKey)) {
      try {
        CustomEassyLoading().startLoading();
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: userEmailCtrl.text, password: userPassCtrl.text);
        CustomEassyLoading().stopLoading();
      } on FirebaseAuthException catch (e) {
        // print("Exception is ${e.code}");
        CustomEassyLoading().stopLoading();
        ApiErrorHandleService().handleStatusCodeError(e.code);
        // if (e.code == "user-not-found") {
        //   CustomScafoldMessages(isWarning: true)
        //       .showMeassage(context, "User not Found");
        // } else if (e.code == "invalid-email") {
        //   CustomScafoldMessages(isWarning: true)
        //       .showMeassage(context, "Invalid Email");
        // } else if (e.code == "wrong-password") {
        //   CustomScafoldMessages(isWarning: true)
        //       .showMeassage(context, "Password is Incorrect");
        // }
      }
    }
  }

  //<<====================================== Try To Register
  void tryToRegister() async {
    if (ValidatorService().validateAndSave(registrationFormKey)) {
      try {
        CustomEassyLoading().startLoading();

        await auth
            .createUserWithEmailAndPassword(
          email: regEmailCtrl.text,
          password: regConfirmPassCtrl.text,
        )
            .then((value) async {
          User? user = auth.currentUser;

          await users.doc(user!.uid).set({
            'uid': user.uid,
            'email': user.email,
            'isEmailVerified': user.emailVerified, // will also be false
            "bookedTour": [],
          });
        });
        CustomEassyLoading().stopLoading();
      } on FirebaseAuthException catch (e) {
        // print("Exception is ${e.code}");
        CustomEassyLoading().stopLoading();
        ApiErrorHandleService().handleStatusCodeError(e.code);
        // if (e.code == "user-not-found") {
        //   CustomScafoldMessages(isWarning: true)
        //       .showMeassage(context, "User not Found");
        // } else if (e.code == "invalid-email") {
        //   CustomScafoldMessages(isWarning: true)
        //       .showMeassage(context, "Invalid Email");
        // } else if (e.code == "wrong-password") {
        //   CustomScafoldMessages(isWarning: true)
        //       .showMeassage(context, "Password is Incorrect");
        // }
      }
    }
  }

//<<======================================================= LogOut
  void logOut() {
    auth.signOut();
  }
}
