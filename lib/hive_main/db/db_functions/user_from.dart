import 'dart:developer';
import 'dart:io';

import 'package:car_maintanance/hive_main/db/models/expense_db/expense_db.dart';
import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:car_maintanance/hive_main/db/models/route_db/route_db.dart';
import 'package:car_maintanance/hive_main/db/models/service_db/service_db.dart';
import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class User {
  //creating singleton for making the class instances common
  User._internal();
  static User instance = User._internal();
  factory User() {
    return instance;
  }

  ValueNotifier<List<MainBoxUser>> carListNotifier = ValueNotifier([]);

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
    List<ExpenseModel>? expenses,
    List<RefuelModel>? refuels,
    List<ServiceModel>? services,
    List<RouteModel>? route,
    List<IncomeModel>? income,
    int? id,
  }) async {
    try {
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
        expenses: expenses,
        refuels: refuels,
        services: services,
        route: route,
        income: income,
        id: id,
      );

      final box = await Hive.openBox<MainBoxUser>('user_box');
      // If an ID is provided, update the existing user

      // Otherwise, add a new user
      int newId = await box.add(newUser);
      newUser.id = newId;
      await box.put(newId, newUser);
      log('id is :::::; $newId');
      // final temp = MainBoxUser(
      //   userName: userName,
      //   carName: carName,
      //   brandName: brandName,
      //   modelName: modelName,
      //   fuel: fuel,
      //   image: image,
      //   fuelCapacity: fuelCapacity,
      //   sFuel: sFuel,
      //   sFuelCapacity: sFuelCapacity,
      //   note: note,
      //   expenses: expenses,
      //   refuels: refuels,
      //   services: services,
      //   route: route,
      //   income: income,
      //   id: id,
      // );

      await fetchAllData();

      // carListNotifier.notifyListeners();
      stdout.write(newUser.userName);
      stdout.write(newUser.carName);
      stdout.write(newUser.brandName);
      stdout.write(newUser.modelName);
    } catch (e) {
      // Handle the exception
      stdout.write('Error occurred while adding user: $e');
    }
  }

  // Get helper function
  Future<void> fetchAllData() async {
    final data = await displayRegisterDetails();
    carListNotifier.value.clear();

    for (var element in data) {
      carListNotifier.value.add(element);
    }

    carListNotifier.notifyListeners();
  }

  // Read operation
  Future<List<MainBoxUser>> displayRegisterDetails() async {
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      return box.values.toList();
    } catch (e) {
      // Handle the exception
      stderr.write('Error occurred while displaying register details: $e');
      return []; // Return an empty list or handle the error appropriately
    }
  }

  // Delete operation
  Future<void> deleteRegisterDetails(int index) async {
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      var deletedUser = box.getAt(index);
      if (deletedUser != null) {
        await box.deleteAt(index);
        fetchAllData();
        log('User details deleted successfully');
      } else {
        log('User details not found at index $index');
      }
    } catch (e) {
      // Handle the exception
      stderr.write('Error occurred while deleting register details: $e');
    }
  }
}


//  // Add Details || income || Service || Refuel || Route || Expense
//   Future<void> carMaintenanceAdd({
//     List<ExpenseModel>? expenses,
//     List<RefuelModel>? refuels,
//     List<ServiceModel>? services,
//     List<RouteModel>? route,
//     List<IncomeModel>? income,
//   }) async {
//     try {
//       final newCar = MainBoxUser(
//         expenses: expenses,
//         refuels: refuels,
//         services: services,
//         route: route,
//       );
//       await carsBox.add(newCar);
//     } catch (e) {
//       // Handle the exception
//       stderr.write('Error occurred while adding car maintenance details: $e');
//     }
//   }



