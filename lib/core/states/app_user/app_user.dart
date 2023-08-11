// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:passit/core/enums/navigation_enums.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';

import 'auth_user.dart';

class AppUser extends GetxController {
  AuthUserInformations? _informations;
  String? _loginProviderToken;
  bool _isUserLogged = false;

  bool get isUserLoggedPreviously => _informations != null;
  String? get loginProviderToken => _loginProviderToken;
  bool get isUserLogged => _isUserLogged;
  AuthUserInformations? get informations => _informations;
  static AppUser get init => Get.put(AppUser());
  static AppUser get instance => Get.find<AppUser>();

  Future<void> login(
      {required AuthUserInformations informations,
      required String? token}) async {
    AppSettings.instance.sharedPreferencesManager
        .setUserInformations(informations);
    await saveToken(token);
    _loginProviderToken = token;
    _isUserLogged = true;
    _informations = informations;
    update();
  }

  Future<bool> checkAuth() async {
    _loginProviderToken = await getToken;
    _informations =
        AppSettings.instance.sharedPreferencesManager.getUserInformations();
    if (_loginProviderToken != null && _informations?.email != null) {
      return true;
    } else {
      await forgetAll();
      return false;
    }
  }

  Future<void> saveToken(String? token) async {
    const storage = FlutterSecureStorage();

    await storage.write(key: 'token', value: token);
  }

  Future<String?> get getToken async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'token');
  }

  Future<void> logout(BuildContext context) async {
    await forgetAll();
    update();
    context.goNamed(NavigationEnums.welcome.name, extra: {"isSignUp": false});
  }

  Future<void> forgetAll() async {
    _isUserLogged = false;
    _informations = null;
    _loginProviderToken = null;
    await saveToken(null);
    AppSettings.instance.sharedPreferencesManager.forgetUserInformations();
  }
}
