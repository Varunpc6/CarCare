// import 'dart:io';
// import 'package:car_maintanance/hive_main/db/models/route_db/route_db.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class RoutePlan {
//   final Box<RouteModel> routeInitialBox = Hive.box<RouteModel>('route_box');

// // Add
//   Future<void> addRoute({
//     String? origin,
//     String? startDate,
//     String? startTime,
//     int? initialOdometer,
//     String? destination,
//     String? endDate,
//     String? endTime,
//     int? finalOdometer,
//     int? total,
//     String? paymentMethod,
//     String? reason,
//   }) async {
//     final newRoute = RouteModel(
//       origin: origin,
//       startDate: startDate,
//       startTime: startTime,
//       initialOdometer: initialOdometer,
//       destination: destination,
//       endDate: endDate,
//       endTime: endTime,
//       finalOdometer: finalOdometer,
//       total: total,
//       paymentMethod: paymentMethod,
//       reason: reason,
//     );
//     await routeInitialBox.add(newRoute);
//     stdout.write(newRoute.destination);
//     stdout.write(routeInitialBox);
//     stdout.write('image added ${newRoute.origin}');
//   }

// // Read
//   List<RouteModel> displayRoute() {
//     return routeInitialBox.values.toList();
//   }

// // Update
//   Future<void> updateRoute({
//     int? index,
//     String? origin,
//     String? startDate,
//     String? startTime,
//     int? initialOdometer,
//     String? destination,
//     String? endDate,
//     String? endTime,
//     int? finalOdometer,
//     int? total,
//     String? paymentMethod,
//     String? reason,
//   }) async {
//     final updateRoute = RouteModel(
//       origin: origin,
//       startDate: startDate,
//       startTime: startTime,
//       initialOdometer: initialOdometer,
//       destination: destination,
//       endDate: endDate,
//       endTime: endTime,
//       finalOdometer: finalOdometer,
//       total: total,
//       paymentMethod: paymentMethod,
//       reason: reason,
//     );
//     await routeInitialBox.add(updateRoute);
//     await routeInitialBox.putAt(index!, updateRoute);
//   }

// // Delete
//   Future<void> deleteRoute(int index) async {
//     var deletedRoute = routeInitialBox.getAt(index);
//     if (deletedRoute != null) {
//       // stdout.write('Deleted user details: $deletedUser');
//       await routeInitialBox.deleteAt(index);
//       stdout.write('User details deleted successfully');
//     } else {
//       // stdout.write('User details not found at index $index');
//     }
//   }
// }
