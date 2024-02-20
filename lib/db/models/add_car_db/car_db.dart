import 'package:hive_flutter/hive_flutter.dart';

part 'car_db.g.dart';

@HiveType(typeId: 0)
class Car extends HiveObject {
  @HiveField(0)
  String? car;

  @HiveField(1)
  String? brand;

  @HiveField(2)
  String? model;

  @HiveField(3)
  String? mainFuelType;

  @HiveField(4)
  int? mainFuelCapacity;

  @HiveField(5)
  String? secondFuelType;

  @HiveField(6)
  int? secondFuelCapacity;

  @HiveField(7)
  String? note;

  Car(
      {this.car,
      this.brand,
      this.model,
      this.mainFuelType,
      this.mainFuelCapacity,
      this.secondFuelType,
      this.secondFuelCapacity,
      this.note});
}
