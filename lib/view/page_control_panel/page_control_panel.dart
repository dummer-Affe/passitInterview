import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';
import 'package:passit/core/states/app_settings/device_mode.dart';
import 'package:passit/core/states/app_user/app_user.dart';

import 'drawer.dart';
import 'my_appbar.dart';

class PageControlPanel extends StatefulWidget {
  final Widget child;
  const PageControlPanel({super.key, required this.child});

  @override
  State<PageControlPanel> createState() => _PageControlPanelState();
}

class _PageControlPanelState extends State<PageControlPanel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(
      builder: (controller) => GetBuilder<AppUser>(
        builder: (controller) => Scaffold(
          backgroundColor: AppColors.background,
          body: widget.child,
          drawer: AppSettings.instance.deviceMode != DeviceMode.large
              ? MyDrawer()
              : null,
          appBar: MyAppBar(),
        ),
      ),
    );
  }
}
