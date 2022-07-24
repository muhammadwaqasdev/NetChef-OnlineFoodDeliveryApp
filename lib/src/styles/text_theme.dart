import 'package:flutter/material.dart';
import 'package:net_chef/src/styles/app_colors.dart';

class TextStyling {
  TextStyling._();

  static TextStyle paragraphTheme = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontStyle: FontStyle.normal,
  );
  static TextStyle normalText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontStyle: FontStyle.normal,
  );
  static TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontStyle: FontStyle.normal,
  );
  static TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontStyle: FontStyle.normal,
  );
  static TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontStyle: FontStyle.normal,
  );
  static TextStyle h4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontStyle: FontStyle.normal,
  );
}
