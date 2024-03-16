import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/main.dart';
import 'package:car_maintanance/shared_Pref/shared_class.dart';
import 'package:flutter/material.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await setupHive(); // Box & Adapters
  await User().fetchAllData();
  await SharedPref().getCarBrand();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
