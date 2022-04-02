import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Trans;

import '../../controller/auth_controller.dart';
import '../../controller/screen_controller.dart';
import '../../generated/locale_keys.g.dart';
import '../../services/page_navigation.dart';
import '../../services/validator_service.dart';
import '../home/home_screen.dart';
import '../variables/icon_variables.dart';
import '../variables/text_style.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/custom_text_field.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

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
          key: authCtrl.registrationFormKey,
          child: Container(
            width: _width,
            height: _height,
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "$registrationIcon",
                    height: 64,
                    width: 64,
                  ),
                ),
                Text(
                  LocaleKeys.signUp_body1.tr(),
                  style: titlePrimaryBoldStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  LocaleKeys.signUp_body2.tr(),
                  style: normalRegularStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: authCtrl.regEmailCtrl,
                  validator: ValidatorService().validateEmail,
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  labelText: LocaleKeys.signUp_email.tr(),
                  hintText: LocaleKeys.signUp_emailHint.tr(),
                ),
                Obx(
                  () => CustomTextField(
                    controller: authCtrl.regPassCtrl,
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
                Obx(
                  () => CustomTextField(
                    controller: authCtrl.regConfirmPassCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.signUp_cPasswordRule1.tr();
                      } else if (authCtrl.regPassCtrl.text !=
                          authCtrl.regConfirmPassCtrl.text) {
                        return LocaleKeys.signUp_cPasswordRule2.tr();
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.lock),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !screenCtrl.isPasswordVisible.value,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'^[\n\r\s]+')),
                    ],
                    labelText: LocaleKeys.signUp_cPassword.tr(),
                    hintText: LocaleKeys.signUp_cPassword.tr(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          screenCtrl.passwordVisibility();
                        },
                        icon: screenCtrl.isPasswordVisible.value
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomElevatedButton(
                  buttonName: LocaleKeys.signUp_title.tr(),
                  onPressed: () => authCtrl.tryToRegister(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: LocaleKeys.signUp_bottom.tr(),
                        style: normalRegularStyle,
                      ),
                      const TextSpan(
                        text: " ",
                        style: smallRegularStyle,
                      ),
                      TextSpan(
                        text: LocaleKeys.login_title.tr(),
                        style: normalPrimaryBoldStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => PageNavigationService()
                                  .removeAndNavigateWithStream(
                                const HomeScreen(),
                                const LoginScreen(),
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
