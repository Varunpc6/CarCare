import 'package:hive_flutter/hive_flutter.dart';

part 'refuel_db.g.dart';

@HiveType(typeId: 0)
class Refuel {
  @HiveField(0)
  String? fuelDate;

  @HiveField(1)
  String? fuelTime;

  @HiveField(2)
  String? fuelOdomerter;

  @HiveField(3)
  String? fuelType;

  @HiveField(4)
  String? fuelPrice;

  @HiveField(5)
  String? fuelStation;

  @HiveField(6)
  String? fuelPayment;

  @HiveField(7)
  String? fuelReason;

  Refuel({
    this.fuelDate,
    this.fuelTime,
    this.fuelOdomerter,
    this.fuelType,
    this.fuelPrice,
    this.fuelStation,
    this.fuelPayment,
    this.fuelReason,
  });
}
