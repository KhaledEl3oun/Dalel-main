import 'package:first_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static final pacificoStyle = TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w400,
      color: AppColors.deepBrown,
      fontFamily: "Pacifico");

  static final poppinsStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
      fontFamily: "Poppins");

  static final poppinsTitleStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: AppColors.black,
      fontFamily: "Poppins");

  static final poppinsSmallStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: AppColors.black,
      fontFamily: "Poppins");
}
