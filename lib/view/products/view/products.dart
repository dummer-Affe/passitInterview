import 'package:flutter/material.dart';
import 'package:passit/view/dummy_product/view/product_button.dart';

import '../../../product/model/dummy_products/models/dummy_product_model.dart';

class Products extends StatelessWidget {
  final List<DummyProductResponse> products;
  final int columnCount;
  const Products(
      {super.key, required this.products, required this.columnCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < products.length; i += columnCount)
          Row(
            children: [
              for (int j = i; j < i + columnCount; j++)
                if (j < products.length) ProductView(product: products[j])
            ],
          )
      ],
    );
  }
}
