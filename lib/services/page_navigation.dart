import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNavigationService {
  generalNavigation(Widget nextScreen) {
    Get.to(nextScreen);
  }

  removeAndNavigate(Widget nextScreen) {
    Get.off(nextScreen);
  }

  removeAllAndNavigate(Widget nextScreen) {
    Get.offAll(nextScreen);
  }

  backScreen() {
    Get.back(result: true);
  }
}
