import 'package:flutter/material.dart';

import 'infContainer.dart';
import 'on_hover.dart';

class DropDown extends StatefulWidget {
  final List<DropDownItem> itemsData;
  final String title, hintText;
  final double width;
  final double? height;
  final Color? dropdownColor, borderColor, color, hoverColor;
  final TextStyle? titleStyle, textStyle, hintStyle;
  final double? radius, borderWith;
  final bool expands;
  final Alignment align;
  final EdgeInsetsGeometry padding;
  final int flex;
  final void Function(String value) onChange;
  const DropDown(
      {super.key,
      required this.itemsData,
      this.title = "",
      required this.width,
      required this.height,
      this.hintText = "",
      required this.titleStyle,
      required this.hintStyle,
      required this.textStyle,
      this.borderColor,
      this.color,
      this.align = Alignment.centerLeft,
      this.padding = EdgeInsets.zero,
      this.flex = 1,
      this.expands = false,
      this.borderWith,
      this.radius,
      this.hoverColor,
      required this.dropdownColor,
      required this.onChange});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late String hintText;

  @override
  void initState() {
    hintText = widget.hintText;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.expands
        ? Expanded(
            flex: widget.flex,
            child: view(),
          )
        : SizedBox(
            width: widget.width,
            height: widget.height,
            child: view(),
          );
  }

  Widget view() {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != "")
            Padding(
              padding: EdgeInsets.only(left: widget.width * 1.5 / 10),
              child: Text(
                widget.title,
                style: widget.titleStyle,
              ),
            ),
          Expanded(
            child: OnHover(builder: (isHovered) {
              Color? color = isHovered && widget.hoverColor != null
                  ? widget.hoverColor
                  : widget.color;
              return InfContainer(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: widget.borderWith != null
                        ? Border.all(
                            width: widget.borderWith!,
                            color:
                                widget.borderColor ?? const Color(0xFF000000))
                        : null,
                    color: color,
                    borderRadius: widget.radius != null
                        ? BorderRadius.circular(widget.radius!)
                        : null),
                child: DropdownButtonHideUnderline(
                  child: InfContainer(
                    child: DropdownButton(
                        dropdownColor: widget.dropdownColor,
                        isExpanded: true,
                        elevation: 0,
                        items: widget.itemsData
                            .map((data) => DropdownMenuItem<String>(
                                  value: data.value,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: widget.width * 7.5 / 10,
                                        child: Text(
                                          data.item,
                                          style: widget.textStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            widget.onChange(value!);
                            hintText = value;
                          });
                        },
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                              alignment: widget.align,
                              child: Text(hintText, style: widget.hintStyle)),
                        )),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class DropDownItem {
  String item;
  String value;
  DropDownItem({required this.item, required this.value});
}
