 // Background Image
  import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

buildBackgroundImage(BuildContext context) {
    return Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
