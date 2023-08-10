import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_fonts/app_fonts_panel.dart';
import 'package:passit/product/widgets/drop_down.dart';
import 'package:passit/product/widgets/radio_button_list.dart';
import 'package:passit/product/widgets/sized_button/sized_button.dart';
import 'package:passit/view/products/model/sort_by.dart';

import '../model/products_view_model.dart';

class FilterView extends StatefulWidget {
  final ProductsViewModel model;
  const FilterView({super.key, required this.model});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 262,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 10,
          offset: Offset(0, 2),
          spreadRadius: 0,
        )
      ], color: AppColors.background),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filter",
                style: AppFontsPanel.filterTitle,
              ),
              SizedButton(
                width: 60,
                height: 25,
                onPressed: () {
                  widget.model.resetFilter();
                },
                borderColor: AppColors.secondary,
                child: Text(
                  "Reset",
                  style: AppFontsPanel.filterText,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            "Price",
            style: AppFontsPanel.filterTitle,
          ),
          const SizedBox(
            height: 10,
          ),
          Observer(builder: (context) {
            return SizedBox(
                width: double.infinity,
                child: Slider(
                    value: widget.model.maxPrice,
                    activeColor: AppColors.secondary,
                    min: 0,
                    max: 5000,
                    onChanged: (value) {
                      widget.model.updateMaxPrice(value);
                    }));
          }),
          Observer(builder: (context) {
            return Text(
              "Max Price ${widget.model.maxPrice.toInt()}",
              style: AppFontsPanel.filterText,
            );
          }),
          const SizedBox(
            height: 10,
          ),
          DropDown(
              itemsData: [
                DropDownItem(
                    item: SortBy.higherToLower.toText,
                    value: SortBy.higherToLower.toText),
                DropDownItem(
                    item: SortBy.lowerToHigher.toText,
                    value: SortBy.lowerToHigher.toText),
              ],
              hintText: SortBy.lowerToHigher.toText,
              width: 160,
              height: 30,
              titleStyle: AppFontsPanel.filterText,
              hintStyle: AppFontsPanel.filterText,
              textStyle: AppFontsPanel.filterText,
              dropdownColor: AppColors.bottomSheetBg,
              borderColor: AppColors.secondary,
              borderWith: 1,
              radius: 7,
              onChange: (value) {
                widget.model.updateSortBy(value);
              }),
          const SizedBox(
            height: 20,
          ),
          if (!widget.model.hasInitCategory)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  "Categories",
                  style: AppFontsPanel.filterTitle,
                ),
                const SizedBox(
                  height: 11,
                ),
                RadioButtonList(
                  [
                    for (var category in widget.model.categories!)
                      RadioButtonItem(
                          text: category.capitalize!, value: category),
                  ],
                  textStyle: AppFontsPanel.filterTitle,
                  isVertical: true,
                  activeColor: AppColors.secondary,
                  unselectedColor: AppColors.text,
                  onChanged: (value) {
                    widget.model.updateCategory(value);
                  },
                ),
                const SizedBox(
                  height: 11,
                ),
              ],
            )
        ]),
      ),
    );
  }
}
