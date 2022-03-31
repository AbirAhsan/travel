import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../generated/locale_keys.g.dart';
import '../services/page_navigation.dart';
import '../services/shared_data.dart';
import '../views/variables/icon_variables.dart';

class ScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GetStorage sharedData = GetStorage();
  RxBool isPasswordVisible = false.obs;
  TabController? tabController;
  TextEditingController? remarks = TextEditingController();

  RxInt initialIndex = 0.obs;
  RxInt onBoardIndex = 0.obs;
  RxString swipeDirection = "".obs;
  RxBool isOffline = false.obs;

  @override
  onInit() {
    tabController = TabController(
      vsync: this,
      length: 4,
      initialIndex: initialIndex.value,
    );

    super.onInit();
  }

  void splashDelay() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      //   getOnboardToken().then((isTokenAvailable) {
      //     if (isTokenAvailable) {
      //       SharedDataManageService().getToken().then((token) {
      //         if (token!.isNotEmpty) {
      //           PageNavigationService().removeAndNavigate(
      //             const HomeScreen(),
      //           );
      //         } else {
      //           PageNavigationService().removeAndNavigate(
      //             const LoginScreen(),
      //           );
      //         }
      //       });
      //     } else {
      //       PageNavigationService().removeAndNavigate(
      //         const OnBoardingScreen(),
      //       );
      //     }
      //   });
    });
  }

  void setOnboardToken() {
    sharedData.write("onboardToken", "1");
  }

  Future<bool> getOnboardToken() async {
    String onboardToken = sharedData.read(
          "onboardToken",
        ) ??
        "0";
    return onboardToken == "1" ? true : false;
  }

  void passwordVisibility() {
    isPasswordVisible.value = true;
    Future.delayed(const Duration(seconds: 3)).then((value) {
      isPasswordVisible.value = false;
    });
  }
}
