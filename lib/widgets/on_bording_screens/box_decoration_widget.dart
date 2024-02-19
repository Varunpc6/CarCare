import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

// User_Register_from screen 
class AppDecorations {
  static final BoxDecoration customDecoration = BoxDecoration(
    color: AppGradients.userBg,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: AppColors.primary,
      width: 2.0,
    ),
  );
}
