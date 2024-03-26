import 'package:hive/hive.dart';

part 'refuel_db.g.dart';

@HiveType(typeId: 4)
class RefuelModel {
  @HiveField(0)
  String? date;

  @HiveField(1)
  String? time;

  @HiveField(2)
  int? odometer;

  @HiveField(3)
  String? typeFuel;

  @HiveField(4)
  int? price;

  @HiveField(5)
  int? totalCost;

  @HiveField(6)
  int? gallon;

  @HiveField(7)
  String? paymentMethod;

  @HiveField(8)
  String? reason;

  @HiveField(9)
  String? gasStation;

  RefuelModel({
    required this.date,
    required this.time,
    required this.odometer,
    required this.typeFuel,
    this.price,
    this.totalCost,
    this.gallon,
    this.gasStation,
    this.paymentMethod,
    this.reason,
  });
}
