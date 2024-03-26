import 'dart:io';
import 'package:car_maintanance/hive_main/db/models/service_db/service_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ServicePlan {
  final Box<ServiceModel> serviceInitialBox =
      Hive.box<ServiceModel>('service_box');

// Add
  Future<void> addService({
    String? date,
    String? time,
    int? odometer,
    String? service,
    String? place,
    String? paymentMethod,
    String? reason,
    int? value,
  }) async {
    final newRoute = ServiceModel(
      date: date,
      time: time,
      odometer: odometer,
      service: service,
      place: place,
      paymentMethod: paymentMethod,
      reason: reason,
      value: value,
    );
    await serviceInitialBox.add(newRoute);
    stdout.write(newRoute.service);
    stdout.write(serviceInitialBox);
    stdout.write('Service Added ${newRoute.odometer}');
  }

// Read
  List<ServiceModel> displayRoute() {
    return serviceInitialBox.values.toList();
  }

// Update
  Future<void> updateRoute({
    int? index,
    String? date,
    String? time,
    int? odometer,
    String? service,
    String? paymentMethod,
    String? reason,
  }) async {
    final updateService = ServiceModel(
      date: date,
      time: time,
      odometer: odometer,
      service: service,
      paymentMethod: paymentMethod,
      reason: reason,
    );
    await serviceInitialBox.add(updateService);
    await serviceInitialBox.putAt(index!, updateService);
  }

// Delete
  Future<void> deleteRoute(int index) async {
    var deletedRoute = serviceInitialBox.getAt(index);
    if (deletedRoute != null) {
      // stdout.write('Deleted user details: $deletedUser');
      await serviceInitialBox.deleteAt(index);
      stdout.write('User details deleted successfully');
    } else {
      // stdout.write('User details not found at index $index');
    }
  }
}
