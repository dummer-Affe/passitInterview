import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:passit/core/constants/image_paths.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_fonts/font_sizer.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';
import 'package:passit/product/widgets/filter_textfield/filter_textfield.dart';
import 'package:passit/view/user_search/model/user_search_view_model.dart';

import '../../../product/init/enum/service_status.dart';
import 'view_profile.dart';

class UserSearchView extends StatefulWidget {
  const UserSearchView({super.key});

  @override
  State<UserSearchView> createState() => _UserSearchViewState();
}

class _UserSearchViewState extends State<UserSearchView> {
  var viewModel = UserSearchViewModel();
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (state) {
      return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: ListView(
          //shrinkWrap: true,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Enter Your User Id",
                style: TextStyle(
                    color: state.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: FontSizer(
                          mobile: context.width * 0.8,
                          mid: context.width * 0.6,
                          large: context.width * 0.5)
                      .size,
                  child: FilterTextfield(
                    controller: controller,
                    onSearched: (value) {
                      viewModel.getProfile(value.trim());
                    },
                    borderColor: AppColors.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (context) => switch (viewModel.serviceStatus) {
                    ServiceStatus.waiting => const SizedBox(),
                    ServiceStatus.onProcess =>
                      onProcessView(width: context.width, height: 600),
                    ServiceStatus.failed => failedView(),
                    ServiceStatus.success => ViewProfile(
                        user: viewModel.data!,
                      )
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      );
    });
  }

  Widget failedView() {
    return SizedBox(
      width: context.width,
      height: 600,
      child: Center(
        child: Image.asset(ImagePaths.noData),
      ),
    );
  }

  Widget onProcessView({required double width, required double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.secondary,
        ),
      ),
    );
  }
}
