import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';
import 'package:car_maintanance/hive_main/db/models/expense_db/expense_db.dart';
import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:car_maintanance/hive_main/db/models/route_db/route_db.dart';
import 'package:car_maintanance/hive_main/db/models/service_db/service_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> setupHive() async {
  // Open Hive boxes
  await Hive.openBox<IncomeModel>('income_box');
  await Hive.openBox<MainBoxUser>('main_user_box');
  await Hive.openBox<ExpenseModel>('expense_box');
  await Hive.openBox<ServiceModel>('eervice_box');
  await Hive.openBox<RefuelModel>('refuel_box');
  await Hive.openBox<RouteModel>('route_box');

  // Register type adapters
  Hive.registerAdapter(MainBoxUserAdapter());
  Hive.registerAdapter(ExpenseModelAdapter());
  Hive.registerAdapter(ServiceModelAdapter());
  Hive.registerAdapter(RefuelModelAdapter());
  Hive.registerAdapter(RouteModelAdapter());
  Hive.registerAdapter(IncomeModelAdapter());
}
