import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:passit/core/constants/image_paths.dart';
import 'package:passit/core/enums/navigation_enums.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_fonts/app_fonts_panel.dart';
import 'package:passit/product/widgets/sized_button/sized_button.dart';
import 'package:passit/view/home/model/home_view_model.dart';

import '../../../core/states/app_settings/app_settings.dart';

class CategoriesView extends StatelessWidget {
  final HomeViewModel model;
  CategoriesView({super.key, required this.model});
  final List<String> images = [
    ImagePaths.phoneCategory,
    ImagePaths.laptopCategory,
    ImagePaths.fragrancesCategory,
    ImagePaths.skincareCategory,
    ImagePaths.groceriesCategory,
    ImagePaths.homeDecorationCategory,
    ImagePaths.furniturepCategory,
    ImagePaths.topsCategory,
    ImagePaths.womensDressesCategory,
    ImagePaths.womensShoesCategory,
    ImagePaths.mensShirtsCategory,
    ImagePaths.mensShoesCategory,
    ImagePaths.mensWatchesCategory,
    ImagePaths.womensWatchesCategory,
    ImagePaths.womensBagsCategory,
    ImagePaths.womensJewelleryCategory,
    ImagePaths.sunglassesCategory,
    ImagePaths.automotiveCategory,
    ImagePaths.motorcycleCategory,
    ImagePaths.lightingCategory,
  ];

  @override
  Widget build(BuildContext context) {
    var figma = AppSettings.instance.figma;
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            controller: model.scrollController,
            children: [
              for (int i = 0; i < model.categories!.length; i++)
                Padding(
                  padding: figma.paddingOnly(right: 20),
                  child: SizedButton(
                    onPressed: () {
                      context.goNamed(NavigationEnums.products.name,
                          extra: model.categories![i]);
                    },
                    height: double.infinity,
                    width:
                        figma.px(AppFontsPanel.categoryWidth, Axis.horizontal),
                    radius: 14,
                    color: AppColors.secondary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          model.categories![i].capitalize!,
                          style: AppFontsPanel.baseTitleMid,
                        ),
                        figma.spacer(20, Axis.vertical),
                        Image.asset(
                          images[i],
                          height: figma.px(
                                  AppFontsPanel.categoryHeight, Axis.vertical) /
                              2,
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: figma.paddingOnly(right: 30),
            child: SizedButton(
                width: figma.px(50, Axis.vertical),
                height: figma.px(50, Axis.vertical),
                color: AppColors.itemBackground,
                child: Icon(
                  Icons.arrow_right,
                  color: AppColors.background,
                  size: figma.px(20, Axis.vertical),
                ),
                onPressed: () {
                  model.scroll();
                }),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: figma.paddingOnly(left: 30),
            child: SizedButton(
                width: figma.px(50, Axis.vertical),
                height: figma.px(50, Axis.vertical),
                color: AppColors.itemBackground,
                child: Icon(
                  Icons.arrow_left,
                  color: AppColors.background,
                  size: figma.px(20, Axis.vertical),
                ),
                onPressed: () {
                  model.scroll(forward: false);
                }),
          ),
        )
      ],
    );
  }
}
