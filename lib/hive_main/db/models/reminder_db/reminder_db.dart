import 'package:hive/hive.dart';

part 'reminder_db.g.dart';

@HiveType(typeId: 7)
class ReminderModel {
  @HiveField(0)
  String? expense;

  @HiveField(1)
  String? service;

  @HiveField(2)
  int? odometer;

  @HiveField(3)
  String? date;

  @HiveField(4)
  String? reason;

@HiveField(5)
  int? id;


  ReminderModel({
    required this.expense,
    required this.service,
    required this.odometer,
    this.date,
    this.reason, 
  });
}
