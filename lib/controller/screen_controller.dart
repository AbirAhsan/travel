import 'package:get/get.dart' hide Trans;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travel/views/auth/login_screen.dart';
import 'package:travel/views/home/home_screen.dart';

import '../services/page_navigation.dart';

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
      PageNavigationService()
          .removeAndNavigateWithStream(const HomeScreen(), const LoginScreen());
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
