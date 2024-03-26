import 'dart:developer';
import 'dart:io';

import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/hive_main/db/models/expense_db/expense_db.dart';
import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:car_maintanance/hive_main/db/models/route_db/route_db.dart';
import 'package:car_maintanance/hive_main/db/models/service_db/service_db.dart';
import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';
import 'package:car_maintanance/shared_Pref/shared_class.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<List<RefuelModel>> refuelNotifier = ValueNotifier([]);
ValueNotifier<List<ServiceModel>> serviceNotifier = ValueNotifier([]);
ValueNotifier<List<IncomeModel>> incomeNotifier = ValueNotifier([]);
ValueNotifier<List<ExpenseModel>> expenseNotifier = ValueNotifier([]);
ValueNotifier<List<RouteModel>> routeNotifier = ValueNotifier([]);
// ValueNotifier<List<MainBoxUser>> reminderNotifier = ValueNotifier([]);

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
      await SharedPref()
          .setCarBrand(brandName: brandName, id: newId.toString());
    } catch (e) {
      // Handle the exception
      stdout.write('Error occurred while adding user: $e');
    }
  }

  // Refuel || Service || Income || Expenses || Route
  Future<void> setAllList() async {
    // data && sharedPrefrence instance taken the data from SharedPrefence
    refuelNotifier.value.clear();
    serviceNotifier.value.clear();
    incomeNotifier.value.clear();
    expenseNotifier.value.clear();
    final box = await Hive.openBox<MainBoxUser>('user_box');
    final shared = await SharedPreferences.getInstance();
    List<String>? id = shared.getStringList(ConstName.carName);

    Future.forEach(box.values, (element) {
      if (element.id == int.parse(id![1])) {
        refuelNotifier.value.addAll(element.refuels!);
        serviceNotifier.value.addAll(element.services!);
        incomeNotifier.value.addAll(element.income!);
        expenseNotifier.value.addAll(element.expenses!);
        routeNotifier.value.addAll(element.route!);
      }
    });

    refuelNotifier.notifyListeners();
    serviceNotifier.notifyListeners();
    incomeNotifier.notifyListeners();
    expenseNotifier.notifyListeners();
    routeNotifier.notifyListeners();
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
      throw Exception(e);
    }
  }

  // Update
  // Refuel
  Future<void> updateUserRefuel(RefuelModel updatedUser) async {
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      log(box.values.toString());
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(ConstName.carName);
      List<RefuelModel> temp = [];
      MainBoxUser data = MainBoxUser();

      temp.add(updatedUser);

      // log(list![1]);
      // log('$temp');

      for (var element in box.values) {
        if (element.id.toString() == list![1]) {
          // log("Data Id: ${element.id.toString()} ; SharedId: ${list[1]} ");
          if (element.refuels != null) {
            temp.addAll(element.refuels!);
          }

          data = element;
          log(data.brandName!);
          break;
        }
      }
      // log(data.brandName!);
      // log('2nd temp log');
      // log('$temp');
      try {
        await box.put(
          int.parse(list![1]),
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
        // log('error 5');
        log(e.toString());
      }
      // log('Refuel keri 5');
      await fetchAllData(); // Notify listeners after updating
      log('User details updated successfully');
      //   log("$index");
      // } else {
      //   log('Invalid index: $index');
      // }

      await setAllList();
    } catch (e) {
      // Handle the exception
      stderr.write('Error occurred while updating user details: $e');
    }
  }

  // count of the totalData
  Future<int> getAllDataCount() async {
    log('function keri');
    final box = await Hive.openBox<MainBoxUser>('user_box');
    log('function keri 2');
    final pref = await SharedPreferences.getInstance();
    log('function keri 3');
    final list = pref.getStringList(ConstName.carName);
    MainBoxUser? data;
    int count = 0;
    await Future.forEach(box.values, (element) {
      if (element.id == int.parse(list![1])) {
        data = element;
      }
    });

    log('function keri 4');

    await Future.forEach(data!.refuels!, (element) {
      count = count + 1;
    });
    log('function keri 5');
    await Future.forEach(data!.expenses!, (element) {
      count = count + 1;
    });

    log('function keri 6');

    await Future.forEach(data!.income!, (element) {
      count = count + 1;
    });

    log('function keri 7');

    await Future.forEach(data!.services!, (element) {
      count = count + 1;
    });

    log('function keri 8');

    // await Future.forEach(data!.route!, (element) {
    //   count = count + 1;
    // });

    log('function keri 9');
    // log(count.toString());
    return count;
  }

  Future<void> checkDelete(RefuelModel data) async {
    final box = await Hive.openBox<MainBoxUser>('user_box');
    final pref = await SharedPreferences.getInstance();
    final list = pref.getStringList(ConstName.carName);

    MainBoxUser? value;
    await Future.forEach(box.values, (element) {
      if (element.id == int.parse(list![1])) {
        value = element;
      }
    });

    log('Index check');
    int index = value!.refuels!.indexOf(data);
    List<RefuelModel> temp = value!.refuels!;

    temp.removeAt(index);

    // RefuelModel tempList = temp[index];
    // tempList.date = '1234132';

    await box.put(
        int.parse(list![1]),
        MainBoxUser(
          userName: value!.userName,
          carName: value!.carName,
          brandName: value!.brandName,
          modelName: value!.modelName,
          fuel: value!.fuel,
          image: value!.image,
          fuelCapacity: value!.fuelCapacity,
          sFuel: value!.sFuel,
          sFuelCapacity: value!.sFuel,
          note: value!.note,
          expenses: value!.expenses,
          refuels: temp,
          services: value!.services,
          route: value!.route,
          income: value!.income,
          id: value!.id,
        ));

    await setAllList();
  }

  // Update the Current Data
  Future<void> updateTheData(RefuelModel data) async {
    final box = await Hive.openBox<MainBoxUser>('user_box');
    final pref = await SharedPreferences.getInstance();
    final list = pref.getStringList(ConstName.carName);

    MainBoxUser? value;
    await Future.forEach(box.values, (element) {
      if (element.id == int.parse(list![1])) {
        value = element;
      }
    });

    log('Index check');
    int index = value!.refuels!.indexOf(data);
    List<RefuelModel> temp = value!.refuels!;

    // temp.removeAt(index);

    RefuelModel tempList = temp[index];
    tempList.date = '1234132';
  }

  // Total Odometer
  Future<int> getOdometerSum() async {
    final box = await Hive.openBox<MainBoxUser>('user_box');
    final pref = await SharedPreferences.getInstance();
    final list = pref.getStringList(ConstName.carName);
    MainBoxUser? data;
    int sum = 0;
    await Future.forEach(box.values, (element) {
      if (element.id == int.parse(list![1])) {
        data = element;
      }
    });

    await Future.forEach(data!.refuels!, (element) {
      sum = sum + element.odometer!;
    });

    await Future.forEach(data!.expenses!, (element) {
      sum = sum + element.odometer!;
    });

    await Future.forEach(data!.income!, (element) {
      sum = sum + element.odometer!;
    });

    await Future.forEach(data!.services!, (element) {
      sum = sum + element.odometer!;
    });

    // await Future.forEach(data!.route!, (element) {
    //   sum = sum + element.finalOdometer!;
    // });
    log(sum.toString());
    return sum;
  }

  // Service
  Future<void> updateUserService(ServiceModel updatedService) async {
    log(updatedService.toString());
    log('Service keri');
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      log(box.values.toString());
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(ConstName.carName);
      List<ServiceModel> temp = [];
      MainBoxUser data = MainBoxUser();

      temp.add(updatedService);

      log(list![1]);
      log('$temp');

      for (var element in box.values) {
        if (element.id.toString() == list[1]) {
          if (element.services != null) {
            temp.addAll(element.services!);
          }

          data = element;
          log(data.brandName!);
          break;
        }
      }
      log(data.brandName!);
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
      log('Service keri 5');
      await fetchAllData(); // Notify listeners after updating
      log('Service details updated successfully');
      await setAllList();
    } catch (e) {
      // Handle the exception
      stderr.write('Error occurred while updating user details: $e');
    }
  }

  // Route
  Future<void> updateUserRoute(RouteModel updatedRoute) async {
    // log(updatedUser.toString());
    // log('Refuel keri');
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      log(box.values.toString());
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(ConstName.carName);
      List<RouteModel> temp = [];
      MainBoxUser data = MainBoxUser();

      temp.add(updatedRoute);

      // log(list![1]);
      // log('$temp');

      for (var element in box.values) {
        if (element.id.toString() == list![1]) {
          // log("Data Id: ${element.id.toString()} ; SharedId: ${list[1]} ");
          if (element.route != null) {
            temp.addAll(element.route!);
          }

          data = element;
          log(data.brandName!);
          break;
        }
      }
      // log(data.brandName!);
      // log('2nd temp log');
      // log('$temp');
      try {
        await box.put(
          int.parse(list![1]),
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
            income: data.income,
            note: data.note,
            id: data.id,
            refuels: data.refuels,
            route: temp,
          ),
        );
      } catch (e) {
        // log('error 5');
        log(e.toString());
      }
      // log('Refuel keri 5');
      await fetchAllData(); // Notify listeners after updating
      log('Route details updated successfully');
      //   log("$index");
      // } else {
      //   log('Invalid index: $index');
      // }
      await setAllList();
    } catch (e) {
      // Handle the exception
      stderr.write('Error occurred while updating user details: $e');
    }
  }

  // Income
  Future<void> updateUserIncome(IncomeModel updatedIncome) async {
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      log(box.values.toString());
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(ConstName.carName);
      List<IncomeModel> temp = [];
      MainBoxUser data = MainBoxUser();

      temp.add(updatedIncome);

      // log(list![1]);
      // log('$temp');

      for (var element in box.values) {
        if (element.id.toString() == list![1]) {
          // log("Data Id: ${element.id.toString()} ; SharedId: ${list[1]} ");
          if (element.income != null) {
            temp.addAll(element.income!);
          }

          data = element;
          log(data.brandName!);
          break;
        }
      }
      // log(data.brandName!);
      // log('2nd temp log');
      // log('$temp');
      try {
        await box.put(
          int.parse(list![1]),
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
            note: data.note,
            id: data.id,
            refuels: data.refuels,
            route: data.route,
            income: temp,
          ),
        );
      } catch (e) {
        // log('error 5');
        log(e.toString());
      }
      // log('Refuel keri 5');
      await setAllList();
      await fetchAllData(); // Notify listeners after updating
      log('Income details updated successfully');
      //   log("$index");
      // } else {
      //   log('Invalid index: $index');
      // }
    } catch (e) {
      // Handle the exception
      stderr.write('Error occurred while updating user details: $e');
    }
  }

  // Expense
  Future<void> updateUserExpense(ExpenseModel updatedExpense) async {
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      log(box.values.toString());
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(ConstName.carName);
      List<ExpenseModel> temp = [];
      MainBoxUser data = MainBoxUser();

      temp.add(updatedExpense);

      for (var element in box.values) {
        if (element.id.toString() == list![1]) {
          // log("Data Id: ${element.id.toString()} ; SharedId: ${list[1]} ");
          if (element.expenses != null) {
            temp.addAll(element.expenses!);
          }

          data = element;
          log(data.brandName!);
          break;
        }
      }
      try {
        await box.put(
          int.parse(list![1]),
          MainBoxUser(
            id: data.id,
            userName: data.userName,
            brandName: data.brandName,
            carName: data.carName,
            fuel: data.fuel,
            fuelCapacity: data.fuelCapacity,
            sFuel: data.sFuel,
            sFuelCapacity: data.sFuelCapacity,
            image: data.image,
            modelName: data.modelName,
            services: data.services,
            note: data.note,
            refuels: data.refuels,
            route: data.route,
            income: data.income,
            expenses: temp,
          ),
        );
      } catch (e) {
        // log('error 5');
        log(e.toString());
      }
      // log('Refuel keri 5');
      await fetchAllData(); // Notify listeners after updating
      log('Epenses details updated successfully');
      //   log("$index");
      // } else {
      //   log('Invalid index: $index');
      // }
      await setAllList();
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
