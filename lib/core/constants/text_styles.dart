import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.blackColor,
  );

  static const TextStyle bodyTextBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: AppColors.blackColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.greyColor,
  );
}
