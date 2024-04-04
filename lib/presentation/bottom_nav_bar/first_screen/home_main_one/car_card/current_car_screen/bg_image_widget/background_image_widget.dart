import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: ResSize.left(context),
      top: ResSize.top(context),
      right: ResSize.right(context),
      bottom: ResSize.bottom(context),
      child: Container(
        width: ResSize.width(context),
        height: ResSize.height(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.currentCar),
            fit: BoxFit
                .fitWidth, // Use BoxFit.cover for a responsive background image
          ),
        ),
      ),
    );
  }
}
