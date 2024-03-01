import 'dart:io';
import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class User {
  final Box<MainBoxUser> carsBox = Hive.box<MainBoxUser>('main_user_box');

  // Add user
  Future<void> userAdd({
    String? userName,
    String? carName,
    String? brandName,
    String? modelName,
    String? fuel,
    String? image,
    String? fuelCapacity,
    String? sFuel,
    String? sFuelCapacity,
    String? note,
  }) async {
    final newUser = MainBoxUser(
      userName: userName,
      carName: carName,
      brandName: brandName,
      modelName: modelName,
      fuel: fuel,
      image: image,
      fuelCapacity: fuelCapacity,
      sFuel: sFuel,
      sFuelCapacity: sFuelCapacity,
      note: note,
    );
    await carsBox.add(newUser);
    stdout.write(newUser.userName);
    stdout.write(newUser.carName);
    stdout.write(newUser.brandName);
    stdout.write(newUser.modelName);
  }

  // Read operation
  List<MainBoxUser> displayRegisterDetails() {
    return carsBox.values.toList();
  }

  // Delete operation
  Future<void> deleteRegisterDetails(int index) async {
    var deletedUser = carsBox.getAt(index);
    if (deletedUser != null) {
      await carsBox.deleteAt(index);
      stdout.write('User details deleted successfully');
    } else {
      stderr.write('User details not found at index $index');
    }
  }

  // Future<void> carExAdd({
  //   List<ExpenseModel>? expenses,
  //   List<RefuelModel>? refuels,
  //   List<ServiceModel>? services,
  //   List<RouteModel>? route,
  //   List<IncomeModel>? income,
  // }) async {
  //   // Implement this method based on your requirements
  // }
}

