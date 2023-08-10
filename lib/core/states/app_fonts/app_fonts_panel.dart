import 'package:flutter/material.dart';
import 'package:passit/core/states/app_fonts/font_sizer.dart';

import '/core/states/app_colors/app_colors.dart';
import '/core/states/app_settings/app_settings.dart';

class AppFontsPanel {
  static EdgeInsetsGeometry get verticalImagePadding =>
      AppSettings.instance.figma.paddingSymmetric(vertical: imagePadding);
  static double get imagePadding => 20;
  static EdgeInsetsGeometry get horizontalContentPadding =>
      AppSettings.instance.figma.paddingSymmetric(horizontal: 10);

  static double get horizontalPadding => AppSettings.instance.figma
      .px(FontSizer(mobile: 30, mid: 60, large: 150).size, Axis.horizontal);
  static double get buttonHeight =>
      AppSettings.instance.figma.px(56, Axis.vertical);
  static TextStyle get errorStyle => AppSettings.instance.figma
      .style(fontSize: 14, color: AppColors.error, fontWeight: FontWeight.w400);

  static TextStyle get bigTitleStyle => AppSettings.instance.figma
      .style(fontSize: 28, color: AppColors.text, fontWeight: FontWeight.w700);
  static TextStyle get titleStyle => AppSettings.instance.figma
      .style(fontSize: 24, color: AppColors.text, fontWeight: FontWeight.w700);
  static TextStyle get secondTitleStyle => AppSettings.instance.figma.style(
      fontSize: 16, color: AppColors.hintText, fontWeight: FontWeight.w400);
  static TextStyle get thirdTitleStyle => AppSettings.instance.figma.style(
      fontSize: 18, color: AppColors.hintText, fontWeight: FontWeight.w400);
  static TextStyle get textStyle => AppSettings.instance.figma
      .style(fontSize: 16, color: AppColors.text, fontWeight: FontWeight.w700);

  static TextStyle get jobsButtonStyle => AppSettings.instance.figma.style(
      fontSize: 16, color: AppColors.jobsButton, fontWeight: FontWeight.w700);

  static TextStyle get storyGiverStyle => AppSettings.instance.figma.style(
      fontSize: 12, color: AppColors.hintText, fontWeight: FontWeight.w400);

  static TextStyle get bigText => AppSettings.instance.figma.style(
      fontSize: 40, color: AppColors.buttonText, fontWeight: FontWeight.w400);
  static TextStyle get buttonText => AppSettings.instance.figma.style(
      fontSize: 24, color: AppColors.buttonText, fontWeight: FontWeight.w400);
  static TextStyle get smallText => AppSettings.instance.figma.style(
      fontSize: 16, color: AppColors.buttonText, fontWeight: FontWeight.w400);
  static TextStyle get bottomSheetLabelText => AppSettings.instance.figma.style(
      fontSize: 12, color: AppColors.buttonText, fontWeight: FontWeight.w400);

  static TextStyle get verantulgenCategoryStyle => AppSettings.instance.figma
      .style(fontSize: 10, color: AppColors.text, fontWeight: FontWeight.w300);
  static TextStyle get paragraphStyle => AppSettings.instance.figma.style(
      fontSize: 15,
      color: AppColors.text,
      fontWeight: FontWeight.w300,
      height: 2);
  static TextStyle get textStyleReverse => AppSettings.instance.figma.style(
      fontSize: 16, color: AppColors.background, fontWeight: FontWeight.w700);
  static TextStyle get underlineText => AppSettings.instance.figma.style(
      fontSize: 16,
      color: AppColors.text,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline);
  static TextStyle get buttonStyle => AppSettings.instance.figma
      .style(fontSize: 16, color: AppColors.text, fontWeight: FontWeight.w700);
  static TextStyle get buttonStyleUnderline => AppSettings.instance.figma.style(
      fontSize: 16,
      color: AppColors.text,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline);
  static TextStyle get smallStyle => AppSettings.instance.figma
      .style(fontSize: 14, color: AppColors.text, fontWeight: FontWeight.w600);
  static TextStyle get smallUnderlineStyle => AppSettings.instance.figma.style(
      fontSize: 14,
      color: AppColors.text,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline);
  static TextStyle get searchHint => AppSettings.instance.figma.style(
      fontSize: 14, color: AppColors.searchHint, fontWeight: FontWeight.w600);
  static TextStyle get searchStyle => AppSettings.instance.figma.style(
      fontSize: 14, color: AppColors.searchText, fontWeight: FontWeight.w600);
  static TextStyle get textfieldStyle => AppSettings.instance.figma
      .style(fontSize: 18, color: AppColors.text, fontWeight: FontWeight.w600);

  /*----------------------------BASE DESIGN-----------------------------*/

  static TextStyle get baseTitleMid => AppSettings.instance.figma.style(
      fontSize: FontSizer(mobile: 12, mid: 18, large: 18).size,
      color: AppColors.text,
      fontWeight: FontWeight.w600);

  /*--------------------------BASE DESIGN END---------------------------*/

  /*----------------------------Home DESIGN-----------------------------*/

  static TextStyle get homeSliderTitle => TextStyle(
      fontSize: FontSizer(mobile: 18, mid: 24, large: 36).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);
  static TextStyle get footer => AppSettings.instance.figma.style(
      fontSize: FontSizer(mobile: 12, mid: 20, large: 20).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);
  static TextStyle get drawer => AppSettings.instance.figma.style(
      fontSize: FontSizer(mobile: 16, mid: 16, large: 16).size,
      color: AppColors.bottomSheetTitle,
      fontWeight: FontWeight.w400);
  static TextStyle get appBar => TextStyle(
      fontSize: FontSizer(mobile: 18, mid: 18, large: 18).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);
  static double get categoryHeight =>
      FontSizer(mobile: 180, mid: 232, large: 232).size;
  static double get categoryWidth =>
      FontSizer(mobile: 400, mid: 260, large: 168).size;

  /*--------------------------Home DESIGN END---------------------------*/

  /*----------------------------FILTER DESIGN-----------------------------*/

  static TextStyle get filterText => TextStyle(
      fontSize: FontSizer(mobile: 16, mid: 16, large: 16).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);
  static TextStyle get filterTitle => TextStyle(
      fontSize: FontSizer(mobile: 18, mid: 18, large: 18).size,
      color: AppColors.text,
      fontWeight: FontWeight.w600);

  /*--------------------------FILTER DESIGN END---------------------------*/

  /*----------------------------HELPER DESIGN-----------------------------*/

  static double get emailHelperHeight =>
      AppSettings.instance.figma.px(46, Axis.horizontal);

  /*--------------------------HELPER DESIGN END---------------------------*/

  /*----------------------------SET PASSWORD DESIGN-----------------------------*/

  static TextStyle get rule => AppSettings.instance.figma
      .style(fontSize: 12, color: AppColors.text, fontWeight: FontWeight.w600);

  /*--------------------------SET PASSWORD END---------------------------*/

  /*----------------------------LOGIN PAGE-----------------------------*/

  static TextStyle get loginTitleStyle => AppSettings.instance.figma
      .style(fontSize: 40, color: AppColors.text, fontWeight: FontWeight.w700);
  static double get loginTamIcon =>
      AppSettings.instance.figma.px(52, Axis.vertical);
  static double get loginPhoneIcon =>
      AppSettings.instance.figma.px(18, Axis.vertical);
  static double get loginSocialIcon =>
      AppSettings.instance.figma.px(23, Axis.vertical);

  /*--------------------------LOGIN PAGE END---------------------------*/

  /*----------------------------OTP PAGE-------------------------------*/

  static TextStyle get otpStyle => AppSettings.instance.figma
      .style(fontSize: 20, color: AppColors.text, fontWeight: FontWeight.w600);
  static TextStyle get obsurceStyle => AppSettings.instance.figma
      .style(fontSize: 30, color: AppColors.text, fontWeight: FontWeight.w600);
  static TextStyle get resendStyle => AppSettings.instance.figma.style(
      fontSize: 16,
      color: AppColors.hintText,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline);
  static TextStyle get resendTimerStyle => AppSettings.instance.figma.style(
      fontSize: 16, color: AppColors.hintText, fontWeight: FontWeight.w400);
  static double get pinSize =>
      AppSettings.instance.figma.px(40, Axis.horizontal);
  static double get hideIcon =>
      AppSettings.instance.figma.px(18, Axis.horizontal);

  /*--------------------------OTP PAGE END-----------------------------*/

  /*------------------------EMAIL PAGE--------------------------*/
  static TextStyle get welcomeButtonActive => TextStyle(
      fontSize: 14, color: AppColors.secondary, fontWeight: FontWeight.w400);
  static TextStyle get buttonTextStyle => TextStyle(
      fontSize: 14, color: AppColors.background, fontWeight: FontWeight.w400);
  static TextStyle get emailTextStyle => TextStyle(
      fontSize: 14, color: AppColors.secondary, fontWeight: FontWeight.w600);
  static TextStyle get welcomeButtonInactive => TextStyle(
      fontSize: 14, color: AppColors.text, fontWeight: FontWeight.w400);
  static TextStyle get titleLoginPages => TextStyle(
      fontSize: 30, color: AppColors.text, fontWeight: FontWeight.w400);

  /*----------------------EMAIL PAGE END------------------------*/

  /*------------------------ERROR BOTTOM SHEET PAGE--------------------------*/

  static TextStyle get errorSheetTitleStyle => AppSettings.instance.figma.style(
      fontSize: 18,
      color: AppColors.bottomSheetTitle,
      fontWeight: FontWeight.w700);
  static TextStyle get errorSheetTextStyle => AppSettings.instance.figma.style(
      fontSize: 14,
      color: AppColors.bottomSheetText,
      fontWeight: FontWeight.w500);
  static TextStyle get errorSheetTimerStyle => AppSettings.instance.figma.style(
      fontSize: 20,
      color: AppColors.bottomSheetTitle,
      fontWeight: FontWeight.w700);
  /*----------------------ERROR BOTTOM SHEET END------------------------*/

  /*------------------------ERROR BOTTOM SHEET PAGE--------------------------*/

  static TextStyle get bottomSheetTitleStyle =>
      AppSettings.instance.figma.style(
          fontSize: 18,
          color: AppColors.bottomSheetTitle,
          fontWeight: FontWeight.w700);
  static TextStyle get bottomSheetSearchStyle =>
      AppSettings.instance.figma.style(
          fontSize: 16,
          color: AppColors.bottomSheetText,
          fontWeight: FontWeight.w500);
  static TextStyle get bottomSheetTextStyle => AppSettings.instance.figma.style(
      fontSize: 14,
      color: AppColors.bottomSheetTitle,
      fontWeight: FontWeight.w600);
  static TextStyle get bottomSheetHint => AppSettings.instance.figma.style(
      fontSize: 14,
      color: AppColors.bottomSheetHintText,
      fontWeight: FontWeight.w700);
  static TextStyle get bottomSheetHint2 => AppSettings.instance.figma.style(
      fontSize: 14,
      color: AppColors.bottomSheetHintText2,
      fontWeight: FontWeight.w500);
  static TextStyle get bottomSheetSmallText => AppSettings.instance.figma.style(
      fontSize: 12,
      color: AppColors.bottomSheetTitle,
      fontWeight: FontWeight.w600);
  static TextStyle get bottomSheetSmallHint => AppSettings.instance.figma.style(
      fontSize: 12,
      color: AppColors.bottomSheetHintText,
      fontWeight: FontWeight.w700);
  /*----------------------ERROR BOTTOM SHEET END------------------------*/

  /*------------------------PRODUCT PAGE--------------------------*/

  static TextStyle get brandText => TextStyle(
      fontSize: FontSizer(mobile: 12, mid: 16, large: 20).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);
  static TextStyle get reportProductText => TextStyle(
      fontSize: FontSizer(mobile: 12, mid: 16, large: 16).size,
      color: AppColors.secondary,
      fontWeight: FontWeight.w400);
  static TextStyle get productName => AppSettings.instance.figma.style(
      fontSize: FontSizer(mobile: 20, mid: 30, large: 32).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);
  static TextStyle get categoriesText => AppSettings.instance.figma.style(
      fontSize: FontSizer(mobile: 13, mid: 13, large: 13).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);
  static TextStyle get ratingText => AppSettings.instance.figma.style(
      fontSize: FontSizer(mobile: 15, mid: 15, large: 15).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);
  static TextStyle get price => TextStyle(
      fontSize: FontSizer(mobile: 35, mid: 35, large: 35).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);
  static TextStyle get descriptionTitle => TextStyle(
      fontSize: FontSizer(mobile: 25, mid: 25, large: 25).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);
  static TextStyle get descriptionText => TextStyle(
      fontSize: FontSizer(mobile: 12, mid: 12, large: 12).size,
      color: AppColors.text,
      fontWeight: FontWeight.w400);

  /*----------------------PRODUCT PAGE END------------------------*/
}
