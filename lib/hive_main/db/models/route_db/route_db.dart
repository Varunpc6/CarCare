// import 'package:hive/hive.dart';

// part 'route_db.g.dart';

// @HiveType(typeId: 5)
class RouteModel {
  // @HiveField(0)
  String? origin;

  // @HiveField(1)
  String? startDate;

  // @HiveField(2)
  String? startTime;

  // @HiveField(3)
  int? initialOdometer;

  // @HiveField(4)
  String? destination;

  // @HiveField(5)
  String? endDate;

  // @HiveField(6)
  String? endTime;

  // @HiveField(7)
  int? finalOdometer;

  // @HiveField(8)
  int? total;

  // @HiveField(9)
  String? paymentMethod;

  // @HiveField(10)
  String? reason;

  RouteModel({
    required this.origin,
    required this.startDate,
    required this.startTime,
    required this.initialOdometer,
    required this.destination,
    this.endDate,
    this.endTime,
    this.finalOdometer,
    this.total,
    this.paymentMethod,
    this.reason,
  });
}
