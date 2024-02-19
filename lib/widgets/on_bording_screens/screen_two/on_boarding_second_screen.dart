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
                        left: MediaQuery.of(context).size.width * 0.22,
                        top: 0,
                        child: SizedBox(
                          // Adjusted for responsiveness
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: MediaQuery.of(context).size.height * 0.11,
                          child: Stack(
                            children: [
                              Container(
                                // Adjusted for responsiveness
                                width: MediaQuery.of(context).size.width * 0.40,
                                height:
                                    MediaQuery.of(context).size.height * 0.40,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: OvalBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: Color(0xFFFB7E3C),
                                    ),
                                  ),
                                ),
                              ),
                              // Rotated Image
                              Positioned(
                                // Adjusted for responsiveness
                                left: 5,
                                top: 20,
                                // Image container
                                child: Container(
                                  // Adjusted for responsiveness
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(ImageConstant.imgR2),
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
                      const Positioned(
                        left: 45,
                        top: 120,
                        child: Text(
                          'For Personal Use',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      // Sub Title
                      const Positioned(
                        left: 30,
                        top: 175,
                        right: 30,
                        child: Text(
                          'It allows you to have total control over your vehicle costs',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
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
