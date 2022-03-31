import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/views/auth/login_screen.dart';

import '../main.dart';

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

  removeAndNavigateWithStream(Widget newScreen) {
    Get.offAll(StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return newScreen;
          } else {
            return const LoginScreen();
          }
        }));
  }

  backScreen() {
    Get.back(result: true);
  }
}
