import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RixaTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final TextEditingController controller;
  final TextStyle? textStyle, labelStyle;
  final TextStyle? hintStyle;
  final double radius;
  final double? borderWidth;
  final int maxLines;
  final int? minLines;
  final Color? color, borderColor;
  final Color? enabledColor;
  final bool showCursor;
  final double? width, height;
  final Color? focusedColor, backgroundColor;
  final dynamic Function(String)? onChanged;
  final bool isUnderline, expands, noInputBorder;
  final TextInputType textInputType;
  final Widget? prefixIcon, suffixIcon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? innerPadding;
  final InputBorder? enabledBorder, focusedBorder;
  final bool autoFocus;
  final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  final LinearGradient? linearGradient;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  RixaTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
    this.textAlignVertical,
    this.minLines,
    this.textStyle,
    this.height,
    this.hintStyle,
    this.color,
    this.linearGradient,
    this.borderColor,
    this.borderWidth,
    this.radius = 10.0,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.focusNode,
    this.enabledColor,
    this.focusedColor,
    this.showCursor = true,
    this.labelText,
    this.inputFormatters = const [],
    this.autoFocus = false,
    this.width,
    this.labelStyle,
    this.isUnderline = true,
    this.expands = false,
    this.textInputType = TextInputType.visiblePassword,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
    EdgeInsetsGeometry? innerPadding,
    this.noInputBorder = false,
  })  : innerPadding =
            innerPadding ?? const EdgeInsets.symmetric(horizontal: 10),
        enabledBorder = !noInputBorder && isUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                    color: enabledColor ?? Colors.black,
                    width: borderWidth ?? 1),
              )
            : !noInputBorder && !isUnderline
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: enabledColor ?? Colors.black,
                        width: borderWidth ?? 1),
                    borderRadius: BorderRadius.circular(radius))
                : null,
        focusedBorder = !noInputBorder && isUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                    color: focusedColor ?? Colors.cyan,
                    width: borderWidth ?? 1),
              )
            : !noInputBorder && !isUnderline
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: focusedColor ?? Colors.cyan,
                        width: borderWidth ?? 1),
                    borderRadius: BorderRadius.circular(radius))
                : null;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor,
          gradient: linearGradient,
          borderRadius: BorderRadius.circular(radius)),
      padding: padding,
      child: TextField(
        controller: controller,
        maxLines: !expands ? maxLines : null,
        minLines: minLines,
        expands: expands,
        autofocus: autoFocus,
        showCursor: showCursor,
        textInputAction:
            expands ? TextInputAction.newline : TextInputAction.done,
        focusNode: focusNode,
        style: textStyle?.copyWith(decoration: TextDecoration.none),
        scrollPadding: EdgeInsets.zero,
        textAlign: textAlign,
        textAlignVertical: textAlignVertical ??
            (expands ? TextAlignVertical.top : TextAlignVertical.center),
        keyboardType: expands ? TextInputType.multiline : textInputType,
        autocorrect: false,
        enableSuggestions: false,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: innerPadding,
          hintStyle: hintStyle,
          isDense: true,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          suffixIcon: suffixIcon,
          border: noInputBorder ? InputBorder.none : null,
          prefixIcon: prefixIcon,
        ),
        onChanged: (text) {
          if (onChanged != null) onChanged!(text);
        },
      ),
    );
  }
}

class RixaTextFieldFull extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final int flex;
  final TextEditingController controller;
  final TextStyle? textStyle, labelStyle;
  final double? width, height;
  final TextStyle? titleStyle, hintStyle, errorStyle;
  final double radius;
  final double? borderWidth;
  final Color? color, borderColor;
  final TextAlignVertical? textAlignVertical;
  final Color? enabledColor;
  final TextAlign textAlign;
  final Color? focusedColor, backgroundColor;
  final dynamic Function(String)? onChanged;
  final bool autoFocus;
  final int maxLines;
  final int? minLines;
  final bool isUnderline, noInputBorder, expands;
  final TextInputType textInputType;
  final Widget? prefixIcon;
  final bool showCursor;
  final EdgeInsetsGeometry? padding, innerPadding;
  final String? errorText;
  final double paddingLeft;
  final bool error;
  final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  const RixaTextFieldFull({
    super.key,
    required this.controller,
    this.hintText = "",
    this.labelText,
    this.textAlign = TextAlign.start,
    this.flex = 1,
    this.textStyle,
    this.labelStyle,
    this.expands = false,
    this.maxLines = 1,
    this.focusNode,
    this.titleStyle,
    this.hintStyle,
    this.inputFormatters = const [],
    this.radius = 10,
    this.width,
    this.height,
    this.showCursor = false,
    this.borderWidth,
    this.color,
    this.innerPadding,
    this.borderColor,
    this.enabledColor,
    this.focusedColor,
    this.textAlignVertical,
    TextStyle? errorStyle,
    this.autoFocus = false,
    this.backgroundColor,
    this.error = false,
    this.onChanged,
    this.minLines,
    this.isUnderline = true,
    this.noInputBorder = false,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.padding,
    this.errorText,
    this.paddingLeft = 0,
  }) : errorStyle = errorStyle ?? const TextStyle(color: Colors.red);
  @override
  Widget build(BuildContext context) {
    return expands
        ? Expanded(
            flex: flex,
            child: view(),
          )
        : view();
  }

  Widget view() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RixaTextField(
          hintText: hintText,
          labelText: labelText,
          controller: controller,
          maxLines: maxLines,
          textStyle: textStyle,
          labelStyle: labelStyle,
          textAlignVertical: textAlignVertical,
          hintStyle: hintStyle,
          inputFormatters: inputFormatters,
          radius: radius,
          borderWidth: borderWidth,
          height: height,
          showCursor: showCursor,
          textAlign: textAlign,
          autoFocus: autoFocus,
          minLines: minLines,
          focusNode: focusNode,
          color: color,
          borderColor: borderColor,
          enabledColor: enabledColor,
          innerPadding: innerPadding,
          width: width,
          focusedColor: focusedColor,
          backgroundColor: backgroundColor,
          onChanged: onChanged,
          isUnderline: isUnderline,
          noInputBorder: noInputBorder,
          textInputType: textInputType,
          prefixIcon: prefixIcon,
          padding: padding,
          expands: expands,
        ),
        if (errorText != null && error)
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Text(errorText!, style: errorStyle),
          )
      ],
    );
  }
}
