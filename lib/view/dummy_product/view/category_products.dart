import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:passit/view/dummy_product/view/product_button.dart';

import '../view_model/dummy_product_model.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key, required this.viewModel});
  final DummyProductViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var product in viewModel.recommendedProducts!.products!)
            ProductView(
              product: product,
            )
        ],
      ),
    );
  }
}
