import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../textfield/textfield.dart';

class FilterTextfield extends StatefulWidget {
  final TextEditingController controller;
  final dynamic Function(String)? onSearched;
  final double vertical, horizontal;
  final Color? borderColor;
  final Color? backgroundColor;
  final TextStyle? textStyle, hintStyle;
  final bool viewDeleteBtn;
  const FilterTextfield(
      {super.key,
      required this.controller,
      this.vertical = 18,
      this.textStyle,
      this.hintStyle,
      this.horizontal = 20,
      this.viewDeleteBtn = true,
      this.borderColor,
      this.backgroundColor,
      required this.onSearched});

  @override
  State<FilterTextfield> createState() => _FilterTextfieldState();
}

class _FilterTextfieldState extends State<FilterTextfield> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (_) {
      var figma = AppSettings.instance.figma;
      return RixaTextField(
        width: double.infinity,
        hintText: "Search",
        noInputBorder: widget.borderColor == null ? true : false,
        controller: controller,
        hintStyle: widget.hintStyle ?? AppFontsPanel.searchHint,
        textStyle: widget.textStyle ?? AppFontsPanel.searchStyle,
        enabledColor: widget.borderColor,
        focusedColor: widget.borderColor,
        textInputType: TextInputType.visiblePassword,
        borderWidth: widget.borderColor != null ? 1.5 : 0,
        textAlignVertical: TextAlignVertical.center,
        showCursor: false,
        height: null,
        innerPadding: EdgeInsets.symmetric(
            vertical: figma.px(widget.vertical, Axis.vertical),
            horizontal: figma.px(widget.horizontal, Axis.horizontal)),
        prefixIcon: controller.text.isEmpty
            ? Padding(
                padding: EdgeInsets.only(
                    left: figma.px(20, Axis.horizontal),
                    right: figma.px(12, Axis.horizontal)),
                child: Icon(
                  Icons.search,
                  size: figma.px(18, Axis.horizontal),
                ),
              )
            : null,
        suffixIcon: widget.viewDeleteBtn && controller.text.isNotEmpty
            ? TextButton(
                onPressed: () {
                  controller.clear();
                  if (widget.onSearched != null) {
                    widget.onSearched!("");
                  }
                  setState(() {});
                },
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 24),
                  child: Icon(
                    Icons.close,
                    size: figma.px(18, Axis.horizontal),
                  ),
                ))
            : null,
        radius: 14,
        onChanged: (value) {
          if (widget.onSearched != null) {
            widget.onSearched!(value);
          }
          setState(() {});
        },
        isUnderline: false,
        backgroundColor: widget.backgroundColor,
      );
    });
  }
}
