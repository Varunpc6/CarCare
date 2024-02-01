import 'package:car_maintanance/routes/app_routes.dart';
import 'package:car_maintanance/theme/theme_helper.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CARCARE',
      theme: theme,
      // ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: const Color.fromARGB(255, 209, 129, 8),
      //   ),
      //   useMaterial3: true,
      // ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
