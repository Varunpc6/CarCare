import 'dart:developer';
import 'dart:io';

import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/hive_main/db/models/expense_db/expense_db.dart';
import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:car_maintanance/hive_main/db/models/route_db/route_db.dart';
import 'package:car_maintanance/hive_main/db/models/service_db/service_db.dart';
import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    List<RefuelModel>? refuels,
    List<ExpenseModel>? expenses,
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

      // Otherwise, add a new user
      int newId = await box.add(newUser);
      newUser.id = newId;
      await box.put(newId, newUser);
      await fetchAllData();
    } catch (e) {
      // Handle the exception
      stdout.write('Error occurred while adding user: $e');
    }
  }

  // Get helper function
  Future<void> fetchAllData() async {
    // Call the displayRegisterDetails function and await its result
    final data = await displayRegisterDetails();

    Future.forEach(data, (element) {
      log('---------');
      log(element.id.toString());
      log(element.refuels.toString());
      log(element.carName.toString());
      log(element.brandName.toString());
      log('---------');
    });

    // Clear the current content of carListNotifier
    carListNotifier.value.clear();

    // Iterate over each element in the retrieved data
    for (var element in data) {
      // Add each element to carListNotifier
      carListNotifier.value.add(element);
    }

    // Notify listeners of carListNotifier about the changes
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

  // Update
  Future<void> updateUserRefuel(RefuelModel updatedUser) async {
    log(updatedUser.toString());
    log('keri');
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      log(box.values.toString());
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(Constants.carName);
      List<RefuelModel> temp = [];
      MainBoxUser data = MainBoxUser();

      temp.add(updatedUser);

      log(list![1]);
      log('$temp');

      for (var element in box.values) {
        if (element.id.toString() == list[1]) {
          log("Data Id: ${element.id.toString()} ; SharedId: ${list[1]} ");
          if (element.refuels != null) {
            temp.addAll(element.refuels!);
            log("00000000000000");
          }
          log("11111111111111");

          data = element;
          log(data.brandName!);
          break;
        }
      }
      log(data.brandName!);
      log('2nd temp log');
      log('$temp');
      try {
        await box.put(
          int.parse(list[1]),
          MainBoxUser(
            userName: data.userName,
            brandName: data.brandName,
            carName: data.carName,
            expenses: data.expenses,
            fuel: data.fuel,
            fuelCapacity: data.fuelCapacity,
            sFuel: data.sFuel,
            sFuelCapacity: data.sFuelCapacity,
            image: data.image,
            modelName: data.modelName,
            services: data.services,
            route: data.route,
            income: data.income,
            note: data.note,
            id: data.id,
            refuels: temp,
          ),
        );
      } catch (e) {
        log('error 5');
        log(e.toString());
      }
      log('keri 5');
      await fetchAllData(); // Notify listeners after updating
      log('User details updated successfully');
      //   log("$index");
      // } else {
      //   log('Invalid index: $index');
      // }
    } catch (e) {
      // Handle the exception
      stderr.write('Error occurred while updating user details: $e');
    }
  }

  // Service
  Future<void> updateUserService(ServiceModel updatedService) async {
    log(updatedService.toString());
    log('keri');
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      log(box.values.toString());
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(Constants.carName);
      List<ServiceModel> temp = [];
      MainBoxUser data = MainBoxUser();

      temp.add(updatedService);

      log(list![1]);
      log('$temp');

      for (var element in box.values) {
        if (element.id.toString() == list[1]) {
          log("Data Id: ${element.id.toString()} ; SharedId: ${list[1]} ");
          if (element.services != null) {
            temp.addAll(element.services!);
            log("00000000000000");
          }
          log("11111111111111");

          data = element;
          log(data.brandName!);
          break;
        }
      }
      log(data.brandName!);
      log('2nd temp log');
      log('$temp');
      try {
        await box.put(
          int.parse(list[1]),
          MainBoxUser(
            userName: data.userName,
            brandName: data.brandName,
            carName: data.carName,
            expenses: data.expenses,
            fuel: data.fuel,
            fuelCapacity: data.fuelCapacity,
            sFuel: data.sFuel,
            sFuelCapacity: data.sFuelCapacity,
            image: data.image,
            modelName: data.modelName,
            route: data.route,
            income: data.income,
            note: data.note,
            id: data.id,
            refuels: data.refuels,
            services: temp,
          ),
        );
      } catch (e) {
        log('error 5');
        log(e.toString());
      }
      log('keri 5');
      await fetchAllData(); // Notify listeners after updating
      log('User details updated successfully');
    } catch (e) {
      // Handle the exception
      stderr.write('Error occurred while updating user details: $e');
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
        // log('User details deleted successfully');
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



