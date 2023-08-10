import 'package:flutter/material.dart';

import '../../../product/model/dummy_products/models/dummy_product_model.dart';
import '../../../product/widgets/carousel_widget.dart';

class ImageWidget extends StatelessWidget {
  final DummyProductResponse? product;
  const ImageWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [...product!.images!];

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey.shade300),
      child: SizedBox(
        width: 500,
        height: 500,
        child: CarouselWidget(
          imagePathList: [...imageList],
        ),
      ),
    );
  }
}
