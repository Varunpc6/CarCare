import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({super.key});

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
                      image: AssetImage(ImageConstant.imgOnBoardingSecond),
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
                    gradient: LinearGradient(
                      begin: Alignment(0.10, -1.50),
                      end: Alignment(-0.1, 1),
                      colors: [
                        Color.fromARGB(255, 53, 37, 29),
                        Color.fromARGB(0, 73, 42, 26),
                        Color.fromARGB(0, 117, 56, 23),
                        Color.fromARGB(0, 48, 30, 21),
                      ],
                    ),
                  ),
                ),
              ),
              // Content Stack
              Positioned(
                left: ResSize.left15(context),
                top: ResSize.top25(context),
                child: SizedBox(
                  width: ResSize.width7(context),
                  height: ResSize.height55(context),
                  child: Stack(
                    children: [
                      // Main Container
                      Positioned(
                        left: ResSize.left(context),
                        top: ResSize.height05(context),
                        child: Container(
                          width: ResSize.width7(context),
                          height: ResSize.height35(context),
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
                          // Head Text
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ConstName.text3,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 10),
                              // Sub text
                              Text(
                                ConstName.text4,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Circular container with Image
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.22,
                        top: 0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: MediaQuery.of(context).size.height * 0.11,
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.40,
                                height:
                                    MediaQuery.of(context).size.height * 0.40,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  shape: const OvalBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: Color(0xFFFB7E3C),
                                    ),
                                  ),
                                  // Ronded Image
                                  image: DecorationImage(
                                    image: AssetImage(ImageConstant.imgR2),
                                    fit: BoxFit.contain,
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
                        ConstName.skip,
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
