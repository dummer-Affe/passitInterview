import 'package:figma_to_flutter/figma_design_io.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passit/core/states/app_settings/device_mode.dart';

import '../../../product/service/general/general_service.dart';
import '../../../product/utility/shared_manager.dart';
import '../app_colors/appearance.dart';
import '../app_user/app_user.dart';

class AppSettings extends GetxController {
  AppSettings() {
    _generalService = GeneralService();
  }

  late Appearance _appearance;
  late final GeneralService _generalService;
  late SharedPreferencesManager _sharedPreferencesManager;
  BuildContext? _context;
  List<String> _categories = [];
  late Figma2Flutter figma;

  late DeviceMode deviceMode;

  BuildContext? get context => _context;
  List<String> get categories => _categories;
  GeneralService get generalService => _generalService;
  Appearance get appearance => _appearance;
  bool get isDarkMode => _appearance.name == "dark";
  SharedPreferencesManager get sharedPreferencesManager =>
      _sharedPreferencesManager;
  static AppSettings get instance => Get.find<AppSettings>();

  Future<void> setup() async {
    Figma.setup(deviceWidth: 1440, deviceHeight: 1024);
    await initSharedReferences();
    String? appearanceName = getAppearanceFromShared() ?? "light";
    if (appearanceName == "light") {
      _appearance = Appearance.light();
    } else {
      _appearance = Appearance.dark();
    }
    await AppUser.instance.checkAuth();
  }

  void updateFigma(BuildContext context) {
    figma = Figma.of(context);
  }

  void updateContext(BuildContext context) {
    if (GetPlatform.isMobile) {
      deviceMode = DeviceMode.mobile;
    } else if (MediaQuery.of(context).size.width > 1000) {
      deviceMode = DeviceMode.large;
    } else if (MediaQuery.of(context).size.width <= 1000 &&
        MediaQuery.of(context).size.width > 600) {
      deviceMode = DeviceMode.mid;
    } else if (MediaQuery.of(context).size.width <= 600) {
      deviceMode = DeviceMode.mobile;
    }
    _context = context;
    updateFigma(context);
    update();
  }

  void changeTheme() {
    _appearance =
        appearance.name == "dark" ? Appearance.light() : Appearance.dark();
    saveAppearance(_appearance.name);
    update();
  }

  void updateCategories(List<String> categories) {
    _categories = categories;
    update();
  }

  Future<void> initSharedReferences() async {
    _sharedPreferencesManager = SharedPreferencesManager();
    await _sharedPreferencesManager.init();
  }

  String? getAppearanceFromShared() {
    return _sharedPreferencesManager.getAppearance;
  }

  Future<void> saveAppearance(String name) async {
    await _sharedPreferencesManager.updateAppearance(name);
  }

  static AppSettings init() {
    return Get.put(AppSettings());
  }
}
