import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:passit/core/enums/navigation_enums.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_fonts/app_fonts_panel.dart';
import 'package:passit/product/functions/my_functions.dart';

import '../../../product/model/dummy_products/models/dummy_product_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});
  final DummyProductResponse product;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: zeroPaddingTextButton(),
      onPressed: () {
        context.goNamed(NavigationEnums.dummyProduct.name,
            pathParameters: {"id": product.id?.toString() ?? ""});
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        product.thumbnail!,
                      )),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              product.title!.capitalize!,
              style: AppFontsPanel.ratingText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "€${product.price!}",
              style: AppFontsPanel.ratingText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary),
                onPressed: () {},
                child: Text(
                  "Add to cart",
                  style: AppFontsPanel.ratingText,
                )),
          )
        ],
      ),
    );
  }
}
