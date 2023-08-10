import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:passit/core/constants/image_paths.dart';
import 'package:passit/core/extensions/navigation_extensions.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_fonts/app_fonts_panel.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';
import 'package:passit/core/states/app_settings/device_mode.dart';
import 'package:passit/core/states/app_user/app_user.dart';
import 'package:passit/product/widgets/sized_button/sized_button.dart';

import '../../core/enums/navigation_enums.dart';
import 'menu_item.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(65);

  final List<MenuItem> menu = [
    const MenuItem(text: "User Data search", page: NavigationEnums.userSearch),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      iconTheme: IconThemeData(
        color: AppColors.text,
      ),
      backgroundColor: AppColors.secondary,
      leading: AppSettings.instance.deviceMode == DeviceMode.large
          ? Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedButton(
                width: context.width * 0.3,
                height: 200,
                onPressed: () {
                  context.goNamed(NavigationEnums.home.name);
                },
                child: Image.asset(ImagePaths.appIcon),
              ),
            )
          : null,
      actions: AppSettings.instance.deviceMode == DeviceMode.large
          ? [
              if (AppUser.instance.isUserLoggedPreviously)
                for (var menuItem in menu)
                  Padding(
                    padding: const EdgeInsets.only(right: 57),
                    child: TextButton(
                        onPressed: () {
                          context.goNamed(menuItem.page.name);
                        },
                        child: Text(
                          menuItem.text,
                          style: AppFontsPanel.appBar,
                        )),
                  ),
              Padding(
                padding: const EdgeInsets.only(right: 57),
                child: TextButton(
                    onPressed: () {
                      context.goNamed(NavigationEnums.products.name);
                    },
                    child: Text(
                      "Products",
                      style: AppFontsPanel.appBar,
                    )),
              ),
              if (AppUser.instance.isUserLoggedPreviously)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedButton(
                    width: 130,
                    height: 35,
                    onPressed: () {
                      AppUser.instance.logout(context);
                    },
                    color: AppColors.background,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Logout",
                            style: AppFontsPanel.appBar,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.logout,
                            color: AppColors.text,
                          )
                        ]),
                  ),
                ),
              if (AppUser.instance.isUserLoggedPreviously)
                const SizedBox(
                  width: 20,
                ),
              if (!AppUser.instance.isUserLoggedPreviously)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedButton(
                    width: 91,
                    height: 35,
                    onPressed: () {
                      context.go(NavigationEnums.welcome.route,
                          extra: {"isSignUp": true});
                    },
                    color: AppColors.background,
                    child: Text(
                      "Sign Up",
                      style: AppFontsPanel.appBar,
                    ),
                  ),
                ),
              if (!AppUser.instance.isUserLoggedPreviously)
                const SizedBox(
                  width: 20,
                ),
              if (!AppUser.instance.isUserLoggedPreviously)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedButton(
                    width: 91,
                    height: 35,
                    onPressed: () {
                      context.go(NavigationEnums.welcome.route,
                          extra: {"isSignUp": false});
                    },
                    color: AppColors.background,
                    child: Text(
                      "Sign In",
                      style: AppFontsPanel.appBar,
                    ),
                  ),
                ),
              if (!AppUser.instance.isUserLoggedPreviously)
                const SizedBox(
                  width: 20,
                ),
              DayNightSwitcher(
                isDarkModeEnabled: AppSettings.instance.isDarkMode,
                onStateChanged: (isDarkModeEnabled) {
                  AppSettings.instance.changeTheme();
                },
              ),
              const SizedBox(
                width: 50,
              ),
            ]
          : null,
    );
  }
}
