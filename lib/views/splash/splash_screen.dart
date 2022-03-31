import '../../controller/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../variables/colors.dart';
import '../variables/icon_variables.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.height;
    final ScreenController screenCtrl = Get.put(ScreenController());
    screenCtrl.splashDelay();
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        color: primaryColor,
        alignment: Alignment.center,
        child: CircleAvatar(
          radius: _width / 10,
          backgroundColor: whiteColor,
          child: Image.asset(
            logo,
            height: _width / 5,
            width: _width / 6,
          ),
        ),
      ),
    );
  }
}
