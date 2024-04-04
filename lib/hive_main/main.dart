
import 'package:car_maintanance/hive_main/db/models/documents_db/document_db.dart';
import 'package:car_maintanance/hive_main/db/models/expense_db/expense_db.dart';
import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:car_maintanance/hive_main/db/models/route_db/route_db.dart';
import 'package:car_maintanance/hive_main/db/models/service_db/service_db.dart';
import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> setupHive() async {
  // // Open Hive boxes
  // await Hive.openBox<IncomeModel>('income_box');
  // await Hive.openBox<MainBoxUser>('main_user_box');
  // await Hive.openBox<ExpenseModel>('expense_box');
  // await Hive.openBox<RefuelModel>('refuel_box');
  // await Hive.openBox<ServiceModel>('service_box');
  // await Hive.openBox<RouteModel>('route_box');

  // Register type adapters
  if (!Hive.isAdapterRegistered(MainBoxUserAdapter().typeId)) {
    Hive.registerAdapter(MainBoxUserAdapter());
  }
  if (!Hive.isAdapterRegistered(ExpenseModelAdapter().typeId)) {
    Hive.registerAdapter(ExpenseModelAdapter());
  }
  if (!Hive.isAdapterRegistered(ServiceModelAdapter().typeId)) {
    Hive.registerAdapter(ServiceModelAdapter());
  }
  if (!Hive.isAdapterRegistered(RefuelModelAdapter().typeId)) {
    Hive.registerAdapter(RefuelModelAdapter());
  }
  if (!Hive.isAdapterRegistered(RouteModelAdapter().typeId)) {
    Hive.registerAdapter(RouteModelAdapter());
  }
  if (!Hive.isAdapterRegistered(IncomeModelAdapter().typeId)) {
    Hive.registerAdapter(IncomeModelAdapter());
  }
  if (!Hive.isAdapterRegistered(DocumentModelAdapter().typeId)) {
    Hive.registerAdapter(DocumentModelAdapter());
  }
  
}
