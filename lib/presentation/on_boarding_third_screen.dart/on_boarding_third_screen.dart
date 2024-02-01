import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class OnBoardingThirdScreen extends StatelessWidget {
  const OnBoardingThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              // Background Image
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                left: 0,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.10, -1.50),
                      end: Alignment(-0.1, 1),
                      colors: [
                        Color(0xFFFB7E3C),
                        Color(0x00FFB086),
                        Color(0x00FB7E3C),
                        Color(0x00FF6A1C),
                      ],
                    ),
                  ),
                ),
              ),
              // Content Stack
              Positioned(
                left: MediaQuery.of(context).size.width * 0.15,
                top: MediaQuery.of(context).size.height *
                    0.34, // Adjusted for responsiveness
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.7, // Adjusted for responsiveness
                  height: MediaQuery.of(context).size.height *
                      0.4, // Adjusted for responsiveness
                  child: Stack(
                    children: [
                      // Rounded Container
                      Positioned(
                        left: 0,
                        top: MediaQuery.of(context).size.height *
                            0.05, // Adjusted for responsiveness
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.7, // Adjusted for responsiveness
                          height: MediaQuery.of(context).size.height *
                              0.3, // Adjusted for responsiveness
                          decoration: ShapeDecoration(
                            color: const Color(0xCCD3D3D3),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 3,
                                color: Color(0xFFFB7E3C),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x33000000),
                                blurRadius: 15,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Circular Image
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.2,
                        top: 0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Stack(
                            children: [
                              Container(
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
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 12,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                              ),
                              // Rotated Image
                              Positioned(
                                left: 18,
                                top: 10,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
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
                      // Texts
                      const Positioned(
                        left: 45,
                        top: 125,
                        child: Text(
                          'Control expenses',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                            height: 0.07,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 16,
                        top: 175,
                        child: SizedBox(
                          width: 222,
                          height: 47,
                          child: Text(
                            'Record all refueling, expenses, income\nand any other costs related to your\nvehicle.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Paprika',
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Skip Button
              Positioned(
                right: 20, // Adjusted for responsiveness
                top: 35,
                child: InkResponse(
                  onTap: () {
                    onTapNext(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Color(0xFFFB7E3C),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
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
    Navigator.pushNamed(context, AppRoutes.userInScreen);
  }
}
