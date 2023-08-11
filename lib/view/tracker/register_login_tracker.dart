// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/enums/navigation_enums.dart';
import '../../core/states/app_user/app_user.dart';
import '../../core/states/app_user/auth_user.dart';

class RegistrationTracker extends GetxController {
  String? username, email, token;
  bool? successfullReg;
  static RegistrationTracker get init => Get.put(RegistrationTracker());
  static RegistrationTracker get instance => Get.find<RegistrationTracker>();
  RegistrationTracker() {
    _clean();
  }

  void _clean() {
    email = null;
    username = null;
    token = null;
  }

  void disposeTracker() {
    _clean();
    GetInstance().delete<RegistrationTracker>();
  }

  /* ---------------------------------REGISTER PROCESS START----------------------------------- */
  Future<void> register({required BuildContext context}) async {
    context.goNamed(NavigationEnums.welcome.name, extra: {"isSignUp": false});
  }
  /* ---------------------------------REGISTER PROCESS END----------------------------------- */
  /* ----------------------------------------------------------------------------------------*/

  /* ---------------------------------LOGIN PROCESS START----------------------------------- */

  Future<void> login(
      {required String? email,
      required String? token,
      required BuildContext context}) async {
    this.email = email;
    this.token = token;

    context.goNamed(NavigationEnums.otp.name);
  }

  Future<void> checkOtp({required BuildContext context}) async {
    await AppUser.instance
        .login(informations: AuthUserInformations(email: email), token: token);
    context.goNamed(NavigationEnums.home.name);
  }
}
