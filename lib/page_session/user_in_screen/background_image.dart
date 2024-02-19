// Background Image
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:flutter/material.dart';

buildBackgroundImage(BuildContext context) {
  return Positioned(
    child: Container(
      width: ResSize.width(context),
      height: ResSize.height(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstant.imgUserIn),
          fit: BoxFit
              .cover, // Use BoxFit.cover for a responsive background image
        ),
      ),
    ),
  );
}
