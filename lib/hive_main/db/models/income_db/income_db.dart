import 'package:hive/hive.dart';

 part 'income_db.g.dart';

@HiveType(typeId: 6)
class IncomeModel {
  @HiveField(0)
  String? date;

  @HiveField(1)
  String? time;

  @HiveField(2)
  int? odometer;

  @HiveField(3)
  String? income;

  @HiveField(4)
  int? value;

  @HiveField(5)
  String? paymentMethod;

  @HiveField(6)
  String? note;

  IncomeModel({
    required this.date,
    required this.time,
    required this.odometer,
    required this.income,
    this.value,
    this.paymentMethod,
    this.note,
  });
}
