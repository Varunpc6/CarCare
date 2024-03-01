import 'dart:io';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RefuelPlan {
  final Box<RefuelModel> refuelInitialBox = Hive.box<RefuelModel>('refuel_box');

// Add
  Future<void> addRefuel({
    String? date,
    String? time,
    int? odometer,
    String? typeFuel,
    int? price,
    int? totalCost,
    int? gallon,
    String? paymentMethod,
    String? reason,
  }) async {
    final newRefuel = RefuelModel(
      date: date,
      time: time,
      odometer: odometer,
      typeFuel: typeFuel,
      price: price,
      totalCost: totalCost,
      gallon: gallon,
      paymentMethod: paymentMethod,
      reason: reason,
    );
    await refuelInitialBox.add(newRefuel);
    stdout.write('${newRefuel.time}\n');
    stdout.write('$refuelInitialBox\n');
    stdout.write('Refuel Added ${newRefuel.odometer}\n');
  }

// Read
  List<RefuelModel> displayRefuel() {
    return refuelInitialBox.values.toList();
  }

// Update
  Future<void> updateRefuel({
    int? index,
    String? date,
    String? time,
    int? odometer,
    String? typeFuel,
    int? price,
    int? totalCost,
    int? gallon,
    String? paymentMethod,
    String? reason,
  }) async {
    final updateRefuel = RefuelModel(
      date: date,
      time: time,
      odometer: odometer,
      typeFuel: typeFuel,
      price: price,
      totalCost: totalCost,
      gallon: gallon,
      paymentMethod: paymentMethod,
      reason: reason,
    );
    await refuelInitialBox.add(updateRefuel);
    await refuelInitialBox.putAt(index!, updateRefuel);
  }

// Delete
  Future<void> deleteRefuel(int index) async {
    var deletedRefuel = refuelInitialBox.getAt(index);
    if (deletedRefuel != null) {
      // print('Deleted user details: $deletedUser');
      await refuelInitialBox.deleteAt(index);
      stdout.write('User details deleted successfully');
    } else {
      // print('User details not found at index $index');
    }
  }
}
