import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:car_maintanance/db/models/db_user_reg/user_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:car_maintanance/theme/theme_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(UserAdapter()); // Register to Adapter
  await Hive.openBox<User>('AppUserBox'); // Open the Box in Hive
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CARCARE',
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
