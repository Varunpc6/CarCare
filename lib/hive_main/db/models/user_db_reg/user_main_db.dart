import 'package:car_maintanance/hive_main/db/models/documents_db/document_db.dart';
import 'package:car_maintanance/hive_main/db/models/expense_db/expense_db.dart';
import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:car_maintanance/hive_main/db/models/reminder_db/reminder_db.dart';
import 'package:car_maintanance/hive_main/db/models/route_db/route_db.dart';
import 'package:car_maintanance/hive_main/db/models/service_db/service_db.dart';
import 'package:hive/hive.dart';

 part 'user_main_db.g.dart';

@HiveType(typeId: 1)
class MainBoxUser extends HiveObject {
  @HiveField(0)
  String? userName;

  @HiveField(1)
  String? carName;

  @HiveField(2)
  String? brandName;

  @HiveField(3)
  String? modelName;

  @HiveField(4)
  String? fuel;

  @HiveField(5)
  String? image;

  @HiveField(6)
  String? fuelCapacity;

  @HiveField(7)
  String? sFuel;

  @HiveField(8)
  String? sFuelCapacity;

  @HiveField(9)
  String? note;

  @HiveField(10)
  List<ExpenseModel>? expenses = [];

  @HiveField(11)
  List<RefuelModel>? refuels = [];

  @HiveField(12)
  List<ServiceModel>? services = [];

  @HiveField(13)
  List<RouteModel>? route = [];

  @HiveField(14)
  List<IncomeModel>? income = [];

  @HiveField(15)
  int? id;

  @HiveField(16)
  List<ReminderModel>? reminder = [];

  @HiveField(17)
  List<DocumentModel>? document = [];

  MainBoxUser({
    this.userName,
    this.carName,
    this.brandName,
    this.modelName,
    this.fuel,
    this.image,
    this.fuelCapacity,
    this.sFuel,
    this.sFuelCapacity,
    this.note,
    this.expenses,
    this.refuels,
    this.services,
    this.route,
    this.income,
    this.reminder,
    this.document,
    this.id,
  });
}
