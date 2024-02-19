import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class OnBoardingThirdScreen extends StatelessWidget {
  const OnBoardingThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: ResSize.width(context),
          height: ResSize.height(context),
          child: Stack(
            children: [
              // Background Image
              Positioned(
                left: ResSize.left(context),
                top: ResSize.top(context),
                child: Container(
                  width: ResSize.width(context),
                  height: ResSize.height(context),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.imgOnBoardingThird),
                      fit: BoxFit
                          .cover, // Use BoxFit.cover for a responsive background image
                    ),
                  ),
                ),
              ),
              // Gradient Overlay
              Positioned(
                left: ResSize.left(context),
                top: ResSize.top(context),
                child: Container(
                  width: ResSize.width(context),
                  height: ResSize.height(context),
                  decoration: const BoxDecoration(
                    gradient: AppGradients.linearGradient,
                  ),
                ),
              ),
              // Content Stack
              Positioned(
                // Adjusted for responsiveness
                left: ResSize.left15(context), // Adjusted for responsiveness
                top: ResSize.top34(context),
                child: SizedBox(
                  // Adjusted for responsiveness
                  width: ResSize.width7(context), // Adjusted for responsiveness
                  height: ResSize.height3(context),
                  child: Stack(
                    children: [
                      // Main Container
                      Positioned(
                        left: ResSize.left(context),
                        top: ResSize.height05(context),
                        child: Container(
                          // Adjusted for responsiveness
                          width: ResSize.width7(context),
                          height: ResSize.height25(context),
                          decoration: ShapeDecoration(
                            color: AppColors.bgWhite,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 3,
                                color: AppColors.primary,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      // Circular Image
                      Positioned(
                        left: ResSize.left22(context),
                        top: ResSize.top(context),
                        child: SizedBox(
                          width: ResSize.width23(context),
                          height: ResSize.height11(context),
                          child: Stack(
                            children: [
                              Container(
                                width: ResSize.width40(context),
                                height: ResSize.height40(context),
                                decoration: const ShapeDecoration(
                                  color: AppColors.circleBgWhite,
                                  shape: OvalBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                              // Rotated Image
                              Positioned(
                                right: ResSize.right04(context),
                                bottom: ResSize.dotBottom02(context),
                                child: Container(
                                  width: ResSize.width14(context),
                                  height: ResSize.height09(context),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(ImageConstant.imgR3),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Head Text
                      Positioned(
                        left: ResSize.left06(context),
                        top: ResSize.top25(context),
                        child: const Text(
                          'Control expenses',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      // Sub Title
                      Positioned(
                        left: ResSize.left07(context),
                        top: ResSize.top20(context),
                        child: const Text(
                          'Record all refueling, expenses, income\nand any other costs related to your\nvehicle.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Skip Button
              Positioned(
                right: ResSize.right03(context), // Adjusted for responsiveness
                top: ResSize.top03(context),
                left: ResSize.left76(context),
                child: InkResponse(
                  onTap: () {
                    onTapNext(context);
                  },
                  child: Container(
                    width: ResSize.width14(context),
                    height: ResSize.height05(context),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// click Next Button
  onTapNext(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.userInScreen);
  }
}
