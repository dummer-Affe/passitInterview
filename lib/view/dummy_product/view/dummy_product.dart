import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_fonts/app_fonts_panel.dart';
import 'package:passit/view/dummy_product/view/product_detail.dart';
import 'package:passit/view/page_control_panel/footer.dart';

import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/enum/service_status.dart';
import '../../../product/widgets/reload_service_button.dart';
import '../view_model/dummy_product_model.dart';
import 'category_products.dart';

class DummyProductPage extends StatefulWidget {
  const DummyProductPage({super.key, this.id});
  final String? id;

  @override
  State<DummyProductPage> createState() => _DummyProductPageState();
}

class _DummyProductPageState extends State<DummyProductPage> {
  final DummyProductViewModel viewModel = DummyProductViewModel();
  @override
  void initState() {
    viewModel.init(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("id:${widget.id}");
    if (widget.id != viewModel.productId) {
      viewModel.init(widget.id);
    }
    return GetBuilder<AppSettings>(builder: (controller) {
      return ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width > 1000 ? 550 : 1200,
                child: Observer(
                  builder: (context) =>
                      switch (viewModel.productServiceStatus) {
                    ServiceStatus.waiting => onProcessView(),
                    ServiceStatus.onProcess => onProcessView(),
                    ServiceStatus.failed =>
                      failedView(onFailed: viewModel.getProduct),
                    ServiceStatus.success => ProductDetail(
                        viewModel: viewModel,
                      )
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Observer(
                builder: (context) =>
                    switch (viewModel.recommendedProductsServiceStatus) {
                  ServiceStatus.waiting => onProcessView(),
                  ServiceStatus.onProcess => onProcessView(),
                  ServiceStatus.failed =>
                    failedView(onFailed: viewModel.getCategoryProducts),
                  ServiceStatus.success => recommendedView()
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Footer()
            ],
          ),
        ],
      );
    });
  }

  Widget recommendedView() {
    return Column(
      children: [
        Text(
          "Products From Same Category",
          style: AppFontsPanel.descriptionTitle,
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
            height: 350,
            width: double.infinity,
            child: CategoryProducts(viewModel: viewModel))
      ],
    );
  }

  Widget onProcessView() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.secondary,
      ),
    );
  }

  Widget failedView({required Function() onFailed}) {
    return Center(
      child: ReloadServiceButton(
        onPressed: () => onFailed,
      ),
    );
  }
}
