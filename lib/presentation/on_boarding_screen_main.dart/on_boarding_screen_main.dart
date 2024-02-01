import 'package:car_maintanance/presentation/on_boarding_one_screen/on_boarding_one_screen.dart';
import 'package:car_maintanance/presentation/on_boarding_second_screen/on_boarding_second_screen.dart';
import 'package:car_maintanance/presentation/on_boarding_third_screen.dart/on_boarding_third_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageState extends StatelessWidget {
  final PageController controller;
  final List<Widget> pages;

  OnboardingPageState({Key? key})
      : controller = PageController(),
        pages = [
          const OnBoardingOneScreen(),
          const OnBoardingSecondScreen(),
          const OnBoardingThirdScreen(),
        ],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      body: Stack(
        children: [
          // page view
          PageView(
            controller: controller,
            children: const [
              OnBoardingOneScreen(),
              OnBoardingSecondScreen(),
               OnBoardingThirdScreen(),
            ],
          ),
          // dot indicators
          Positioned(
            bottom: 50, // Adjust this value as needed
            left: MediaQuery.of(context).size.width * 0.5 -
                15, // Center horizontally
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const ScrollingDotsEffect(
                dotColor: Color.fromARGB(255, 255, 255, 255),
                activeDotColor: Color.fromARGB(255, 208, 112, 9),
                activeStrokeWidth: 2.6,
                activeDotScale: 1.3,
                maxVisibleDots: 5,
                radius: 8,
                spacing: 10,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
