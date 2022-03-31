// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_EN = {
  "app_details": {
    "name": "Doorping Rider"
  },
  "language_select": {
    "Choose_your_Language": "Choose Your Language",
    "buttonName": "Next"
  },
  "onBoard": {
    "title1": "Welcome to Door Ping",
    "body1": "Access immense data of rates instantly. You can easily search & compare exchange rates.",
    "title2": "Easy Track Order",
    "body2": "Access immense data of rates instantly. You can easily search & compare exchange rates.",
    "title3": "Door to Door Delivery",
    "body3": "Access immense data of rates instantly. You can easily search & compare exchange rates.",
    "skip": "Get Started"
  },
  "login": {
    "title": "Login",
    "body": "with your",
    "phoneNumber": "Phone Number",
    "phone": "Phone",
    "email": "E-mail",
    "phoneNumberRule1": "Please Enter Your Mobile Number",
    "phoneNumberRule2": "Mobile number is not valid",
    "password": "Password",
    "passwordRule1": "Please Enter Your Password",
    "passwordRule2": "Password must not be less than 4 characters",
    "bottom": "Don't have an account? "
  },
  "signUp": {
    "title": "Sign Up",
    "body": "with your Business Information",
    "name": "Merchant Full Name",
    "nameRule1": "Please Enter Your Name",
    "nameRule2": "Name is not valid",
    "phoneNumber": "Phone Number",
    "phoneNumberRule1": "Please Enter Your Mobile Number",
    "phoneNumberRule2": "Mobile number is not valid",
    "email": "Email Address",
    "emailRule1": "Please Enter Your Email Address",
    "emailRule2": "Email address is not valid",
    "shopName": "Business Name",
    "shopNameRule1": "Please Enter Your Shop Name",
    "shopNameRule2": "Company Name is not valid",
    "businessShortName": "Business Short Code",
    "businessShortNameRule1": "Business Short code is Required",
    "businessShortNameRule2": "Business Short code minimum value is 2",
    "shopAddress": "Pickup Address",
    "shopAddressRule1": "Please Enter Your Pickup Address",
    "shopAddressRule2": "Pickup Address is not valid",
    "password": "Password",
    "passwordRule1": "Please Enter Your Password",
    "passwordRule2": "Password must not be less than 4 characters",
    "userName": "User ID",
    "userNameBody": "Choose your User ID",
    "bottom": "Already have an account? ",
    "succesfull": "Account Registration Succesfull. Please wait for the confirmation"
  },
  "forgetPassword": {
    "title1": "Forget Password",
    "subtitle": "Forgot Password ?",
    "body1": "Provide Your User ID for which you want to reset your password",
    "userId": "User ID",
    "title2": "Make Selection",
    "body2": "Select which contact details should we use to reset your password",
    "viaSms": "Via SMS",
    "viaMail": "Via Email",
    "title3": "Verification",
    "body3": "A verification code sent to {},\nPlease enter your code",
    "title4": "Reset Password",
    "body4": "Your identity has been verified !\nSet your new password",
    "confirmPass": "Confirm Password",
    "cPassRule1": "Confirm Password Required",
    "cPassRule2": "Not matched to Password",
    "passUpdateTitle": "Congratulation",
    "passUpdatebody": "Password Update Successfully",
    "button1": "Continue",
    "button2": "Check",
    "button3": "Update"
  },
  "otpVerification": {
    "title": "Verification",
    "otp": "OTP Verification",
    "msg": "A verification code has been sent to {}\nPlease Enter The OTP",
    "dinotReceive": "Didn’t receive code ?",
    "button1": "Confirm",
    "resend": "Resend",
    "wait": "Sec left"
  },
  "drawer": {
    "yourName": "Your Name",
    "yourContact": "Your Contact",
    "dashboard": "Dashboard",
    "operation": {
      "title": "Operation",
      "addPercel": "Add Percel",
      "receiveCancelledPercel": "Receive Cancelled Percel"
    },
    "report": {
      "title": "Report",
      "parcelHistory": "Parcel History",
      "cancelledParcelHistory": "Cancelled Parcel History",
      "receivedPaymentHistory": "Received Payment History"
    },
    "instruction": {
      "title": "Instructions",
      "termsAndConditions": "Terms & Conditions",
      "tutorial": "Tutorials"
    },
    "settings": {
      "title": "Settings",
      "profileSettings": "Profile Settings",
      "paymentSettings": "Payment Settings"
    },
    "logOut": "Log Out"
  },
  "profile": {
    "title": "Profile Details",
    "name": "Name",
    "mobile": "Mobile Number",
    "email": "Email Address",
    "update": "Update"
  },
  "popUp": {
    "warning": "Warning",
    "warningMsg1": "Something Went to Wrong",
    "success": "Success",
    "successMsg": "Successfully Done.",
    "title1": "Are You Sure ?",
    "yes": "Yes",
    "no": "No",
    "confirm": "Confirm",
    "back": "Back",
    "cancel": "Cancel",
    "ok": "Done"
  },
  "internetConnectionCheck": {
    "warning": "Please Check Your wifi and mobile data"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_EN": en_EN};
}
