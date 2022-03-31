import '../../services/shared_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class ApiErrorHandleService {
  handleStatusCodeError(Map<String, dynamic> statusCode) {
    if (statusCode["code"] == 401) {
      Get.snackbar(
        "Wrong User",
        statusCode["body"],
        backgroundColor: Colors.red,
      );

      SharedDataManageService().removeToken();
      //  PageNavigationService().removeAndNavigate(const LoginScreen());
    } else if (statusCode["code"] == 400) {
      Get.snackbar(
        "Attention",
        statusCode["body"].toString(),
        backgroundColor: Colors.red,
      );
      // HapticFeedback.lightImpact();

    } else if (statusCode["code"] > 499) {
      Get.snackbar(
        "Attention",
        "Server Error, Try Again after sometimes",
        backgroundColor: Colors.amber,
      );
    } else {
      Get.snackbar(
        statusCode["code"],
        statusCode["body"],
        backgroundColor: Colors.amber,
      );
    }
  }
}
