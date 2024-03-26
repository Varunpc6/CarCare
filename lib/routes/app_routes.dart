import 'package:car_maintanance/presentation/about_screen/about_screen.dart';
import 'package:car_maintanance/presentation/container_Expense_Details_page/container_Expense_Details_page.dart';
import 'package:car_maintanance/presentation/container_details/container_details.dart';
import 'package:car_maintanance/presentation/container_income_details_page/container_income_details_page.dart';
import 'package:car_maintanance/presentation/container_route_details_page/container_route_details_page.dart';
import 'package:car_maintanance/presentation/container_service_details_page/container_service_details_page.dart';
import 'package:car_maintanance/presentation/current_car_screen/current_car_screen.dart';
import 'package:car_maintanance/presentation/edit_car_screen/edit_car_screen.dart';
import 'package:car_maintanance/presentation/expense_list_screen%20copy/expense_list_page.dart';
import 'package:car_maintanance/presentation/expense_screen/add_expense_screen.dart';
import 'package:car_maintanance/presentation/home_page/home_screen.dart';
import 'package:car_maintanance/presentation/income_list_screen%20copy/income_list_page.dart';
import 'package:car_maintanance/presentation/income_screen/add_income_screen.dart';
import 'package:car_maintanance/presentation/my_account_screen/my_account_screen.dart';
import 'package:car_maintanance/presentation/on_boarding_screen_main.dart/on_boarding_screen_main.dart';
import 'package:car_maintanance/presentation/refuel_list_page/refuel_list_screen.dart';
import 'package:car_maintanance/presentation/refuel_screen/add_refuel_screen.dart';
import 'package:car_maintanance/presentation/route_list_screen/route_list_page.dart';
import 'package:car_maintanance/presentation/route_screen/add_route_screen.dart';
import 'package:car_maintanance/presentation/service_list_screen/service_list_page.dart';
import 'package:car_maintanance/presentation/service_screen/add_service_screen.dart';
import 'package:car_maintanance/presentation/settings_screen/settings_screen_main.dart';
import 'package:car_maintanance/presentation/show_car_screen/show_car_detail_screen.dart';
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

  static String showCarDetailScreen = '/show_car_detail_screen';

  static String containerDetailsScreen = '/container_details';

  static String refuelListScreen = '/refuel_list_screen';

  static String serviceListScreen = '/service_list_screen';

  static String expenseListScreen = '/expense_list_screen';

  static String incomeListScreen = '/income_list_page';

  static String routeListScreen = '/route_list_page';

  static String containerExpenseDetailsScreen =
      '/container_expense_details_page';

  static String containerServiceDetailsScreen =
      '/container_service_details_page';

  static const containerIncomeDetailsScreen = '/container_income_details_page';

  static const containerRouteDetailsScreen = '/container_route_details_page';

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
    showCarDetailScreen: (context) => const ShowCarDetails(),
    containerDetailsScreen: (context) => const DetailsScreen(),
    refuelListScreen: (context) => const RefuelListScreen(),
    serviceListScreen: (context) => const ServiceListScreen(),
    expenseListScreen: (context) => const ExpenseListScreen(),
    incomeListScreen: (context) => const IncomeListScreen(),
    routeListScreen: (context) => const RouteListScreen(),
    containerExpenseDetailsScreen: (context) => const ExpenseDetailsScreen(),
    containerServiceDetailsScreen: (context) => const ServiceDetailsScreen(),
    containerIncomeDetailsScreen: (context) => const IncomeDetailsScreen(),
    containerRouteDetailsScreen: (context) => const RouteDetailsScreen(),
  };
}
