import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passit/core/constants/image_paths.dart';
import 'package:passit/core/extensions/navigation_extensions.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_fonts/app_fonts_panel.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';

import '../../core/enums/navigation_enums.dart';
import '../../core/states/app_user/app_user.dart';
import '../../product/widgets/expandedButton.dart';
import '../../product/widgets/infContainer.dart';
import '../../product/widgets/middleOfExpanded.dart';
import '../../product/widgets/sized_button/sized_button.dart';
import 'menu_item.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  final List<MenuItem> menu = [
    const MenuItem(text: "User Data search", page: NavigationEnums.userSearch),
  ];

  @override
  Widget build(BuildContext context) {
    var figma = AppSettings.instance.figma;
    return Drawer(
      backgroundColor: AppColors.bottomSheetBg,
      child: ListView(
        controller: ScrollController(),
        padding: EdgeInsets.zero,
        children: [
          FigmaBox(
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                const FigmaBox(
                  width: 10,
                ),
                ExpandedButton(
                  onPressed: () {
                    context.goNamed(NavigationEnums.home.name);
                  },
                  flex: 3,
                  child: Image.asset(
                    ImagePaths.appIcon,
                    height: figma.px(40, Axis.vertical),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                MiddleOfExpanded(
                    scrollDirection: Axis.vertical,
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: InfContainer(
                          decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.close,
                            size: figma.px(15, Axis.vertical),
                            color: AppColors.text,
                          )),
                    ))
              ],
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DayNightSwitcher(
              isDarkModeEnabled: AppSettings.instance.isDarkMode,
              onStateChanged: (isDarkModeEnabled) {
                AppSettings.instance.changeTheme();
              },
            ),
          ),
          ListTile(
            title: Text(
              "Products",
              style: AppFontsPanel.drawer,
            ),
            onTap: () {
              context.goNamed(NavigationEnums.products.name);
            },
          ),
          if (AppUser.instance.isUserLoggedPreviously)
            for (var menuItem in menu)
              ListTile(
                title: Text(
                  menuItem.text,
                  style: AppFontsPanel.drawer,
                ),
                onTap: () {
                  context.goNamed(menuItem.page.name);
                },
              ),
          const FigmaBox(
            height: 20,
          ),
          if (AppUser.instance.isUserLoggedPreviously)
            Padding(
              padding: figma.paddingSymmetric(horizontal: 10),
              child: SizedButton(
                width: double.infinity,
                height: figma.px(60, Axis.vertical),
                color: AppColors.secondary,
                onPressed: () {
                  AppUser.instance.logout(context);
                },
                child: Text(
                  "LOGOUT",
                  style: AppFontsPanel.buttonStyle,
                ),
              ),
            ),
          if (!AppUser.instance.isUserLoggedPreviously)
            Padding(
              padding: figma.paddingSymmetric(horizontal: 10),
              child: SizedButton(
                width: double.infinity,
                height: figma.px(60, Axis.vertical),
                color: AppColors.secondary,
                onPressed: () {
                  context.go(NavigationEnums.welcome.route,
                      extra: {"isSignUp": false});
                },
                child: Text(
                  "SIGN IN",
                  style: AppFontsPanel.buttonStyle,
                ),
              ),
            ),
          if (!AppUser.instance.isUserLoggedPreviously)
            const FigmaBox(
              height: 20,
            ),
          if (!AppUser.instance.isUserLoggedPreviously)
            Padding(
              padding: figma.paddingSymmetric(horizontal: 10),
              child: SizedButton(
                width: double.infinity,
                height: figma.px(60, Axis.vertical),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  context.go(NavigationEnums.welcome.route,
                      extra: {"isSignUp": true});
                },
                child: Text(
                  "SIGN UP",
                  style: AppFontsPanel.drawer,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
