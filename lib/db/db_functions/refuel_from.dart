import 'package:car_maintanance/db/models/db_user_reg/refuel_db/refuel_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RefuelFrom {
  final Box<Refuel> fuelRegisteredBox = Hive.box<Refuel>('AppRefuelBox');

  // Add
  Future<void> refuelReg({
    required String fuelDate,
    required String fuelTime,
    required String fuelOdomerter,
    required String fuelType,
    required String fuelPrice,
    required String fuelStation,
    required String fuelPayment,
    required String fuelReason,
  }) async {
    final newRefuel = Refuel(
      fuelDate: fuelDate,
      fuelTime: fuelTime,
      fuelOdomerter: fuelOdomerter,
      fuelType: fuelType,
      fuelPrice: fuelPrice,
      fuelStation: fuelStation,
      fuelPayment: fuelPayment,
      fuelReason: fuelReason,
    );
    await fuelRegisteredBox.add(newRefuel);
  }

  // Read
  List<Refuel> displayRefuel() {
    return fuelRegisteredBox.values.toList();
  }

  // Update
  Future<void> updateReful(
    int index,
    String fuelDate,
    String fuelTime,
    String fuelOdomerter,
    String fuelType,
    String fuelPrice,
    String fuelStation,
    String fuelPayment,
    String fuelReason,
  ) async {
    final updateFuel = Refuel(
      fuelDate: fuelDate,
      fuelTime: fuelTime,
      fuelOdomerter: fuelOdomerter,
      fuelType: fuelType,
      fuelPrice: fuelPrice,
      fuelStation: fuelStation,
      fuelPayment: fuelPayment,
      fuelReason: fuelReason,
    );
    await fuelRegisteredBox.putAt(index, updateFuel);
  }

  Future<void> deleteRefuelDetails(int index) async {
    var deleteRefuel = fuelRegisteredBox.getAt(index);
    if (deleteRefuel != null) {
      print('Deleted user details: $deleteRefuel');
      await fuelRegisteredBox.deleteAt(index);
      print('User details deleted successfully');
    } else {
      print('User details not found at index $index');
    }
  }
}
