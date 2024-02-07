import 'package:car_maintanance/presentation/about_screen/about_screen.dart';
import 'package:car_maintanance/presentation/home_screen/home_screen.dart';
import 'package:car_maintanance/presentation/my_account_screen/my_account_screen.dart';
import 'package:car_maintanance/presentation/on_boarding_screen_main.dart/on_boarding_screen_main.dart';
import 'package:car_maintanance/presentation/settings_screen/settings_screen_main.dart';

import 'package:car_maintanance/presentation/splash_screen/splash_screen.dart';
import 'package:car_maintanance/presentation/user_in_screen/user_in_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onBordingScreen = '/on_bording_screen';

  static String userInScreen = '/user_in_Screen';

  static String homeScreen = '/homeScreen';

  static const String myAccountScreen = '/my_account_screen';

  static const String settingsScreen = '/settings';

  static const String aboutScreen = '/about_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    onBordingScreen: (context) => OnboardingPageState(),
    userInScreen: (context) => UserInScreen(),
    homeScreen: (context) => const HomeScreen(),
    myAccountScreen: (context) => const MyAccountScreen(),
    settingsScreen: (context) => const SettingsScreen(),
    aboutScreen: (context) => const AboutScreen(),
  };
}
