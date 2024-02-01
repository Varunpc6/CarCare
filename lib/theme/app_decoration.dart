import 'package:car_maintanance/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  // Gradient decorations
  static BoxDecoration get gradientDeepOrangeToDeepOrange => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0, -0.05),
          end: const Alignment(0.5, 1),
          colors: [
            appTheme.deepOrange400,
            appTheme.deepOrange400.withOpacity(0),
            appTheme.deepOrange50000,
          ],
        ),
      );
  static BoxDecoration get outlineDeeporange4002 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        border: Border.all(
          color: appTheme.deepOrange400,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(
              0,
              0,
            ),
          ),
        ],
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => const BoxDecoration();
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: appTheme.gray10001,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder30 => BorderRadius.circular(
        30,
      );
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        50,
      );
  static BorderRadius get circleBorder55 => BorderRadius.circular(
        55,
      );

  // Custom borders
  static BorderRadius get customBorderBL5 => const BorderRadius.vertical(
        bottom: Radius.circular(5),
      );
  static BorderRadius get customBorderBR5 => const BorderRadius.only(
        bottomRight: Radius.circular(5),
      );
  static BorderRadius get customBorderTL28 => const BorderRadius.vertical(
        top: Radius.circular(28),
      );

  // Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20,
      );
  static BorderRadius get roundedBorder37 => BorderRadius.circular(
        37,
      );
  static BorderRadius get roundedBorder40 => BorderRadius.circular(
        40,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8,
      );
}
