// import 'package:hive/hive.dart';

//  part 'expense_db.g.dart';

// @HiveType(typeId: 2)
class ExpenseModel {
  // @HiveField(0)
  String? date;

  // @HiveField(1)
  String? time;

  // @HiveField(2)
  int? odometer;

  // @HiveField(3)
  String? fuelType;

  // @HiveField(4)
  String? place;

  // @HiveField(5)
  String? paymentMethod;

  // @HiveField(6)
  String? reason;

  ExpenseModel({
    required this.date,
    required this.time,
    required this.odometer,
    required this.fuelType,
    this.place,
    this.paymentMethod,
    this.reason,
  });
}
