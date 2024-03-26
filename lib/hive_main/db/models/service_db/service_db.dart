import 'package:hive/hive.dart';

part 'service_db.g.dart';

@HiveType(typeId: 3)
class ServiceModel {
  @HiveField(0)
  String? date;

  @HiveField(1)
  String? time;

  @HiveField(2)
  int? odometer;

  @HiveField(3)
  String? service;

  @HiveField(4)
  String? place;

  @HiveField(5)
  String? paymentMethod;

  @HiveField(6)
  String? reason;

  @HiveField(7)
  int? value;

  ServiceModel({
    required this.date,
    required this.time,
    required this.odometer,
    required this.service,
    this.place,
    this.paymentMethod,
    this.reason,
    this.value,
  });
}
