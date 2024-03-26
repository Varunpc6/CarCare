// ignore_for_file: use_build_context_synchronously

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SafeArea(
        child: Scaffold(
          body: Center(
            child: Image.asset(ImageConstant.imgFreeHdconvert),
          ),
        ),
      ),
      splashIconSize: 400,
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: const SplashScreenContent(),
    );
  }
}

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({super.key});

  @override
  SplashScreenContentState createState() => SplashScreenContentState();
}

class SplashScreenContentState extends State<SplashScreenContent> {
  @override
  void initState() {
    super.initState();
    checkUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // You can place your loading indicator here
  }
}

// checking the SharedPreferences ***||User In||***
Future<void> checkUser(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final userEntered = prefs.getString(ConstName.prefText1);
  if (userEntered != null) {
    Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
  } else {
    Navigator.pushReplacementNamed(context, AppRoutes.onBordingScreen);
  }
}
