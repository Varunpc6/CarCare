// Round Image
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:flutter/material.dart';

buildCircularImage(BuildContext context) {
  return Positioned(
    child: SizedBox(
      child: Stack(
        children: [
          Positioned(
            left: ResSize.left36(context),
            top: ResSize.top105(context),
            right: ResSize.right33(context),
            child: SizedBox(
              width: ResSize.width14(context),
              height: ResSize.height15(context),
              child: Stack(
                children: [
                  Container(
                    width: ResSize.width40(context),
                    height: ResSize.height15(context),
                    decoration: const ShapeDecoration(
                      color: AppColors.white,
                      shape: CircleBorder(
                        side: BorderSide(
                          width: 2,
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                    child: ClipOval(
                      child: Container(
                        width: ResSize.width40(context),
                        height: ResSize.height1(context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage(ImageConstant.imgFreeHdconvertCom),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
