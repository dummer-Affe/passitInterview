import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passit/core/enums/navigation_enums.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/view/page_control_panel/menu_item.dart';

import '../../core/states/app_fonts/app_fonts_panel.dart';
import '../../core/states/app_user/app_user.dart';

class Footer extends StatelessWidget {
  Footer({super.key});
  final List<MenuItem> menu = [
    const MenuItem(text: "User Data search", page: NavigationEnums.userSearch),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: AppColors.itemBackground,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 57),
            child: TextButton(
                onPressed: () {
                  context.goNamed(NavigationEnums.products.name);
                },
                child: Text(
                  "Products",
                  style: AppFontsPanel.footer,
                )),
          ),
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
                      style: AppFontsPanel.footer,
                    )),
              ),
        ],
      ),
    );
  }
}
