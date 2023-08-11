import 'package:figma_to_flutter/figma_design_io.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:passit/core/constants/image_paths.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_fonts/app_fonts_panel.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';
import 'package:passit/core/states/app_settings/device_mode.dart';
import 'package:passit/product/widgets/filter_textfield/filter_textfield.dart';
import 'package:passit/view/home/model/home_view_model.dart';
import 'package:passit/view/page_control_panel/footer.dart';

import '../../../product/init/enum/service_status.dart';
import '../../../product/widgets/reload_service_button.dart';
import 'categories_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var model = HomeViewModel();
  @override
  void initState() {
    model.init();
    Figma.setup(deviceWidth: 1440, deviceHeight: 1024);
    super.initState();
  }

  late Figma2Flutter figma;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(
      builder: (controller) {
        var figma = AppSettings.instance.figma;
        return ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                figma.spacer(25, Axis.vertical),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      height: figma.px(450, Axis.vertical),
                      width: controller.deviceMode == DeviceMode.mobile
                          ? context.width
                          : 1108,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImagePaths.homepage),
                              fit: BoxFit.fill)),
                      padding: figma.paddingOnly(left: 94, top: 143),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Find the Best Products\nwith Reliability",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      AppFontsPanel.homeSliderTitle.fontSize),
                            ),
                            figma.spacer(30, Axis.vertical),
                            SizedBox(
                                width: 356,
                                child: FilterTextfield(
                                  controller: TextEditingController(),
                                  onSearched: (value) {
                               
                                    model.searchCategory(value);
                                  },
                                  backgroundColor: AppColors.searchBar,
                                ))
                          ]),
                    ),
                  ),
                ),
                figma.spacer(40, Axis.vertical),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppFontsPanel.horizontalPadding),
                  child: Column(
                    children: [
                      Text(
                        "Shop Our Top Categories",
                        style: AppFontsPanel.homeSliderTitle,
                      ),
                    ],
                  ),
                ),
                figma.spacer(25, Axis.vertical),
                SizedBox(
                  height: figma.px(AppFontsPanel.categoryHeight, Axis.vertical),
                  width: context.width,
                  child: Observer(
                    builder: (context) => switch (model.serviceStatus) {
                      ServiceStatus.waiting => onProcessView(),
                      ServiceStatus.onProcess => onProcessView(),
                      ServiceStatus.failed =>
                        failedView(onFailed: model.getCategories),
                      ServiceStatus.success => CategoriesView(
                          model: model,
                        )
                    },
                  ),
                ),
                figma.spacer(50, Axis.vertical),
              ],
            ),
            Footer()
          ],
        );
      },
    );
  }

  Widget failedView({required Function() onFailed}) {
    return Center(
      child: ReloadServiceButton(
        onPressed: () => onFailed,
      ),
    );
  }

  Widget onProcessView() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.secondary,
      ),
    );
  }
}
