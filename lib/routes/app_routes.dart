import 'package:car_maintanance/presentation/about_screen/about_screen.dart';
import 'package:car_maintanance/presentation/current_car_screen/current_car_screen.dart';
import 'package:car_maintanance/presentation/edit_car_screen/edit_car_screen.dart';
import 'package:car_maintanance/presentation/expense_screen/add_expense_screen.dart';
import 'package:car_maintanance/presentation/home_screen/home_screen.dart';
import 'package:car_maintanance/presentation/income_screen/add_income_screen.dart';
import 'package:car_maintanance/presentation/my_account_screen/my_account_screen.dart';
import 'package:car_maintanance/presentation/on_boarding_screen_main.dart/on_boarding_screen_main.dart';
import 'package:car_maintanance/presentation/refuel_screen/add_refuel_screen.dart';
import 'package:car_maintanance/presentation/route_screen/add_route_screen.dart';
import 'package:car_maintanance/presentation/service_screen/add_service_screen.dart';
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

  static const String currentCarScreen = '/current_car_screen';

  static String editCarScreen = '/edit_car_screen';

  static String addRefuelScreen = '/add_refuel_screen';

  static String addExpenseScreen = '/add_expense_screen';

  static String addIncomeScreen = '/add_income_screen';

  static String addServiceScreen = '/add_service_screen';

  static String addRouteScreen = '/add_route_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    onBordingScreen: (context) => OnboardingPageState(),
    userInScreen: (context) => const UserInScreen(),
    homeScreen: (context) => const HomeScreen(),
    myAccountScreen: (context) => const MyAccountScreen(),
    settingsScreen: (context) => const SettingsScreen(),
    aboutScreen: (context) => const AboutScreen(),
    currentCarScreen: (context) => const CurrentCarScreen(),
    editCarScreen: (context) => const EditCarScreen(),
    addRefuelScreen: (context) => const AddRefuelPage(),
    addExpenseScreen: (context) => const AddExpensePage(),
    addIncomeScreen: (context) => const AddIncomePage(),
    addServiceScreen: (context) => const AddServicePage(),
    addRouteScreen: (context) => const AddRoutePage(),
  };
}
