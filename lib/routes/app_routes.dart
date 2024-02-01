import 'package:car_maintanance/presentation/home_screen/home_screen.dart';
import 'package:car_maintanance/presentation/more_page/more_page.dart';
import 'package:car_maintanance/presentation/splash_screen/splash_screen.dart';
import 'package:car_maintanance/presentation/user_in_screen/user_in_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static String userInScreen = '/user_in_Screen';

  static String homeScreen = '/homeScreen';

  static const String morePage = '/morePage';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    userInScreen: (context) => UserInScreen(),
    homeScreen: (context) => const HomeScreen(),
    morePage: (context) => const MorePage(),
  };
}
