import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Trans;
import 'package:travel/controller/screen_controller.dart';
import 'package:travel/services/page_navigation.dart';
import 'package:travel/views/auth/forget_password.dart';
import 'package:travel/views/auth/registration_screen.dart';
import 'package:travel/views/home/home_screen.dart';
import 'package:travel/views/variables/icon_variables.dart';
import 'package:travel/views/variables/text_style.dart';
import 'package:travel/views/widget/custom_elevated_button.dart';
import 'package:travel/views/widget/custom_text_field.dart';

import '../../controller/auth_controller.dart';
import '../../generated/locale_keys.g.dart';
import '../../services/validator_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final AuthController authCtrl = Get.put(AuthController());
    final ScreenController screenCtrl = Get.put(ScreenController());
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Form(
          key: authCtrl.loginFormKey,
          child: Container(
            width: _width,
            height: _height,
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "$loginIcon",
                    height: 64,
                    width: 64,
                  ),
                ),
                Text(
                  LocaleKeys.login_body.tr(),
                  style: titlePrimaryBoldStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: authCtrl.userEmailCtrl,
                  validator: ValidatorService().validateEmail,
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  labelText: LocaleKeys.login_email.tr(),
                ),
                Obx(
                  () => CustomTextField(
                    controller: authCtrl.userPassCtrl,
                    validator: ValidatorService().validatePassword,
                    prefixIcon: const Icon(Icons.lock),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !screenCtrl.isPasswordVisible.value,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'^[\n\r\s]+')),
                    ],
                    labelText: LocaleKeys.login_password.tr(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          screenCtrl.passwordVisibility();
                        },
                        icon: screenCtrl.isPasswordVisible.value
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: LocaleKeys.login_forgetPass.tr(),
                        style: normalRegularStyle,
                      ),
                      const TextSpan(
                        text: " ",
                        style: smallRegularStyle,
                      ),
                      TextSpan(
                          text: LocaleKeys.login_reset.tr(),
                          style: normalPrimaryBoldStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => PageNavigationService()
                                .generalNavigation(
                                    const ForgetPasswordScreen())),
                    ],
                  ),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomElevatedButton(
                  buttonName: LocaleKeys.login_title.tr(),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: LocaleKeys.login_bottom.tr(),
                        style: normalRegularStyle,
                      ),
                      const TextSpan(
                        text: " ",
                        style: smallRegularStyle,
                      ),
                      TextSpan(
                        text: LocaleKeys.signUp_title.tr(),
                        style: normalPrimaryBoldStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => PageNavigationService()
                                  .removeAndNavigateWithStream(
                                const HomeScreen(),
                                const RegistrationScreen(),
                              ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
