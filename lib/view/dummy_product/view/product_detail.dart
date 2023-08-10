import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/states/app_colors/app_colors.dart';
import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../view_model/dummy_product_model.dart';
import 'image_widget.dart';

class ProductDetail extends StatelessWidget {
  final DummyProductViewModel viewModel;
  const ProductDetail({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 1000 ? fullView() : mobileView();
  }

  Widget mobileView() {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageWidget(
              product: viewModel.product,
            ),
            const SizedBox(
              width: 25,
            ),
            SizedBox(
              width: 455,
              height: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Text(viewModel.product!.brand.toString(),
                        style: AppFontsPanel.brandText),
                  ),
                  Text(
                    viewModel.product!.title!,
                    style: AppFontsPanel.productName,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 30),
                    child: Text(viewModel.product!.category.toString(),
                        style: AppFontsPanel.categoriesText),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("€${viewModel.product!.price}",
                        style: AppFontsPanel.price),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: Text("Rating", style: AppFontsPanel.ratingText),
                  ),
                  Text(viewModel.product!.rating.toString(),
                      style: AppFontsPanel.descriptionTitle),
                  RatingBarIndicator(
                    rating: viewModel.product!.rating!,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 30.0,
                    direction: Axis.horizontal,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 25),
                    child: Text("Description",
                        style: AppFontsPanel.descriptionTitle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(
                      height: 75,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ExpandableText(
                            viewModel.product!.description.toString(),
                            expandText: 'show more',
                            collapseText: 'show less',
                            maxLines: 3,
                            style: AppFontsPanel.ratingText,
                            linkColor: AppColors.secondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 220,
                        height: 80,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(255, 182, 68, 1)),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Add To Cart"),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset(ImagePaths.addToCart)
                              ],
                            )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Report Product",
                            style: AppFontsPanel.reportProductText,
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget fullView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageWidget(
          product: viewModel.product,
        ),
        const SizedBox(
          width: 25,
        ),
        SizedBox(
          width: 455,
          height: 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(viewModel.product!.brand.toString(),
                    style: AppFontsPanel.brandText),
              ),
              Text(
                viewModel.product!.title!,
                style: AppFontsPanel.productName,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 30),
                child: Text(viewModel.product!.category.toString(),
                    style: AppFontsPanel.categoriesText),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("€${viewModel.product!.price}",
                    style: AppFontsPanel.price),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                child: Text("Rating", style: AppFontsPanel.ratingText),
              ),
              Text(viewModel.product!.rating.toString(),
                  style: AppFontsPanel.descriptionTitle),
              RatingBarIndicator(
                rating: viewModel.product!.rating!,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 25),
                child:
                    Text("Description", style: AppFontsPanel.descriptionTitle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  height: 75,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ExpandableText(
                        viewModel.product!.description.toString(),
                        expandText: 'show more',
                        collapseText: 'show less',
                        maxLines: 3,
                        style: AppFontsPanel.descriptionText,
                        linkColor: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 300,
                    height: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 182, 68, 1)),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Add To Cart"),
                            const SizedBox(
                              width: 20,
                            ),
                            Image.asset(ImagePaths.addToCart)
                          ],
                        )),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Report Product",
                        style: AppFontsPanel.reportProductText,
                      ))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
