import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';
import 'package:passit/core/states/app_settings/device_mode.dart';
import 'package:passit/product/widgets/sized_button/sized_button.dart';
import 'package:passit/view/products/model/products_view_model.dart';
import 'package:passit/view/products/view/filter_view.dart';
import 'package:passit/view/products/view/products.dart';

import '../../../product/init/enum/service_status.dart';
import '../../../product/widgets/reload_service_button.dart';

class ProductsView extends StatefulWidget {
  final String? category;
  const ProductsView({super.key, this.category});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  var viewModel = ProductsViewModel();
  @override
  void initState() {
    viewModel.init(widget.category);
    Figma.setup(deviceWidth: 1440, deviceHeight: 1024);
    super.initState();
  }

  late DeviceMode deviceMode;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (_) {
      deviceMode = AppSettings.instance.deviceMode;
      return Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Observer(
                builder: (context) => switch (viewModel.serviceStatus) {
                  ServiceStatus.waiting =>
                    onProcessView(width: context.width, height: 800),
                  ServiceStatus.onProcess =>
                    onProcessView(width: context.width, height: 800),
                  ServiceStatus.failed => failedView(
                      onFailed: () {
                        viewModel.init(widget.category);
                      },
                      width: context.width,
                      height: 800),
                  ServiceStatus.success => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (deviceMode == DeviceMode.large)
                              FilterView(
                                model: viewModel,
                              ),
                            if (deviceMode == DeviceMode.large)
                              const SizedBox(
                                width: 10,
                              ),
                            Observer(builder: (context) {
                              double areaW = columnItemCount * 270;
                              return switch (viewModel.productsStatus) {
                                ServiceStatus.waiting =>
                                  onProcessView(width: areaW, height: 800),
                                ServiceStatus.onProcess =>
                                  onProcessView(width: areaW, height: 800),
                                ServiceStatus.failed => failedView(
                                    onFailed: () {
                                      viewModel.init(widget.category);
                                    },
                                    width: areaW,
                                    height: 850),
                                ServiceStatus.success => Products(
                                    products: viewModel.search,
                                    columnCount: columnItemCount)
                              };
                            }),
                          ],
                        ),
                      ],
                    )
                },
              ),
              const SizedBox(
                height: 50,
              ),
              // Footer()
            ],
          ),
          if (deviceMode != DeviceMode.large)
            Positioned(
              right: 50,
              bottom: 50,
              child: SizedButton(
                width: 50,
                height: 50,
                onPressed: () {
                  viewModel.openFilter(context: context, model: viewModel);
                },
                color: AppColors.secondary,
                child: Icon(Icons.filter_list, color: AppColors.text),
              ),
            )
        ],
      );
    });
  }

  int get columnItemCount => deviceMode == DeviceMode.large
      ? 3
      : deviceMode == DeviceMode.mid
          ? 2
          : 1;

  Widget failedView(
      {required Function() onFailed,
      required double width,
      required double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: ReloadServiceButton(
          onPressed: () => onFailed,
        ),
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
