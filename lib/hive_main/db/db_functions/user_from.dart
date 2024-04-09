import 'dart:developer';
import 'dart:io';

import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/hive_main/db/models/documents_db/document_db.dart';
import 'package:car_maintanance/hive_main/db/models/expense_db/expense_db.dart';
import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:car_maintanance/hive_main/db/models/reminder_db/reminder_db.dart';
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
ValueNotifier<List<ReminderModel>> reminderNotifier = ValueNotifier([]);
ValueNotifier<List<DocumentModel>> documentNotifier = ValueNotifier([]);

class User {
  //creating singleton for making the class instances common
  User.internal();
  static User instance = User.internal();
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
    List<ReminderModel>? reminder,
    List<DocumentModel>? document,
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
        reminder: reminder,
        document: document,
        id: id,
      );

      final box = await Hive.openBox<MainBoxUser>('user_box');

      // Otherwise, add a new user
      int newId = await box.add(newUser);
      newUser.id = newId;
      await box.put(newId, newUser);
      // log("${newUser.image.toString()}IOIOIO");
      // log(brandName.toString());
      await fetchAllData();
      await SharedPref()
          .setCarBrand(brandName: brandName, id: newId.toString());
    } catch (e) {
      // Handle the exception
      stdout.write('Error occurred while adding user: $e');
    }
  }

  // Refuel || Service || Income || Expenses || Route || Reminder
  Future<void> setAllList() async {
    // data && sharedPrefrence instance taken the data from SharedPrefence
    refuelNotifier.value.clear();
    routeNotifier.value.clear();
    serviceNotifier.value.clear();
    incomeNotifier.value.clear();
    expenseNotifier.value.clear();
    documentNotifier.value.clear();

    final box = await Hive.openBox<MainBoxUser>('user_box');
    final shared = await SharedPreferences.getInstance();
    List<String>? id = shared.getStringList(ConstName.carName);

    Future.forEach(box.values, (element) {
      if (element.id == int.parse(id![1])) {
        if (element.refuels != null) {
          refuelNotifier.value.addAll(element.refuels!); // Refuel
          refuelNotifier.notifyListeners();
        }
        if (element.services != null) {
          serviceNotifier.value.addAll(element.services!); // Service
          serviceNotifier.notifyListeners();
        }
        if (element.income != null) {
          incomeNotifier.value.addAll(element.income!); // Income
          incomeNotifier.notifyListeners();
        }
        if (element.expenses != null) {
          expenseNotifier.value.addAll(element.expenses!); // Expenses
          expenseNotifier.notifyListeners();
        }
        if (element.route != null) {
          routeNotifier.value.addAll(element.route!); // Route
          routeNotifier.notifyListeners();
        }
        if (element.reminder != null) {
          reminderNotifier.value.addAll(element.reminder!); // Reminder
          reminderNotifier.notifyListeners();
        }
        if (element.document != null) {
          documentNotifier.value.addAll(element.document!);
          documentNotifier.notifyListeners();
        }
      }
    });
  }

  // Get helper function
  Future<void> fetchAllData() async {
    // Call the displayRegisterDetails function and await its result
    final data = await displayRegisterDetails();

    // Future.forEach(data, (element) {
    //   log('---------');
    //   log(element.id.toString());
    //   log(element.refuels.toString());
    //   log(element.carName.toString());
    //   log(element.brandName.toString());
    //   log('---------');
    // });

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
  // Image update
  Future<void> updateUserImage({required String pic}) async {
    final box = await Hive.openBox<MainBoxUser>('user_box');
    String image = pic;

    for (var element in box.values) {
      // find the id so create an for in loop to find the id then store the image.
      if (element.id == 0) {
        element.image = image;
      }
    }
  }

  // Document
  Future<void> updateUserDocument(DocumentModel updatedUser) async {
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(ConstName.carName);
      // Create an temp for store the data update to the refuel model class
      List<DocumentModel> temp = [];
      MainBoxUser data = MainBoxUser(); // Instance of the MainDataBase

      temp.add(updatedUser);

      for (var element in box.values) {
        if (element.id.toString() == list![1]) {
          if (element.document != null) {
            temp.addAll(element.document!);
          }
          data = element;
          break;
        }
      }
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
            refuels: data.refuels,
            document: temp,
          ),
        );
      } catch (e) {
        // log('error 5');
        log(e.toString());
      }
      // log('Refuel keri 5');
      await fetchAllData(); // Notify listeners after updating
      log('User details updated successfully');

      await setAllList();
    } catch (e) {
      // Handle the exception
      stderr.write('Error occurred while updating user details: $e');
    }
  }

  // Refuel
  Future<void> updateUserRefuel(RefuelModel updatedUser) async {
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(ConstName.carName);
      // Create an temp for store the data update to the refuel model class
      List<RefuelModel> temp = [];
      MainBoxUser data = MainBoxUser(); // Instance of the MainDataBase

      temp.add(updatedUser);

      for (var element in box.values) {
        if (element.id.toString() == list![1]) {
          if (element.refuels != null) {
            temp.addAll(element.refuels!);
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

  // // Update the Current Data
  // Future<void> updateTheData(RefuelModel data) async {
  //   final box = await Hive.openBox<MainBoxUser>('user_box');
  //   final pref = await SharedPreferences.getInstance();
  //   final list = pref.getStringList(ConstName.carName);

  //   MainBoxUser? value;
  //   await Future.forEach(box.values, (element) {
  //     if (element.id == int.parse(list![1])) {
  //       value = element;
  //     }
  //   });

  //   log('Index check');
  //   int index = value!.refuels!.indexOf(data);
  //   List<RefuelModel> temp = value!.refuels!;

  //   // temp.removeAt(index);

  //   RefuelModel tempList = temp[index];
  //   tempList.date = '1234132';
  // }

  // Total Odometer
  Future<int> getOdometerSum() async {
    final box = await Hive.openBox<MainBoxUser>('user_box');
    final pref = await SharedPreferences.getInstance();
    final list = pref.getStringList(ConstName.carName);
    MainBoxUser? data;
    int sum = 0;
    int routeOdometer = 0;
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

    await Future.forEach(data!.route!, (element) {
      routeOdometer = element.finalOdometer! - element.initialOdometer!;
      sum = sum + routeOdometer;
    });
    log(routeOdometer.toString());
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
        log(e.toString());
      }
      await fetchAllData(); // Notify listeners after updating
      log('Route details updated successfully');

      await setAllList();
    } catch (e) {
      // Handle the exception
      stderr.write('Error occurred while updating user details: $e');
    }
  }

  // Reminder
  Future<void> updateUserReminder(ReminderModel updateReminder) async {
    try {
      final box = await Hive.openBox<MainBoxUser>('user_box');
      log(box.values.toString());
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(ConstName.carName);
      List<ReminderModel> temp = [];
      MainBoxUser data = MainBoxUser();

      temp.add(updateReminder);

      for (var element in box.values) {
        if (element.id.toString() == list![1]) {
          if (element.reminder != null) {
            temp.addAll(element.reminder!);
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
            route: data.route,
            reminder: temp,
          ),
        );
      } catch (e) {
        log(e.toString());
      }
      await fetchAllData(); // Notify listeners after updating
      log('Route details updated successfully');
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



// Delete function
  // Refuel Delete
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

// Document Delete
  Future<void> checkDeleteDocument(DocumentModel data) async {
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
    int index = value!.document!.indexOf(data);
    List<DocumentModel> temp = value!.document!;

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
          refuels: value!.refuels,
          services: value!.services,
          route: value!.route,
          income: value!.income,
          document: temp,
          id: value!.id,
        ));

    await setAllList();
  }

  Future<void> checkDeleteRoute(RouteModel data) async {
    final box = await Hive.openBox<MainBoxUser>('user_box');
    final pref = await SharedPreferences.getInstance();
    final list = pref.getStringList(ConstName.carName);

    MainBoxUser? value;
    await Future.forEach(box.values, (element) {
      if (element.id == int.parse(list![1])) {
        value = element;
      }
    });

    int index = value!.route!.indexOf(data);
    List<RouteModel> temp = value!.route!;

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
          refuels: value!.refuels,
          services: value!.services,
          route: temp,
          income: value!.income,
          id: value!.id,
        ));

    await setAllList();
  }

  Future<void> checkDeleteExpense(ExpenseModel data) async {
    final box = await Hive.openBox<MainBoxUser>('user_box');
    final pref = await SharedPreferences.getInstance();
    final list = pref.getStringList(ConstName.carName);

    MainBoxUser? value;
    await Future.forEach(box.values, (element) {
      if (element.id == int.parse(list![1])) {
        value = element;
      }
    });

    int index = value!.expenses!.indexOf(data);
    List<ExpenseModel> temp = value!.expenses!;

    temp.removeAt(index);

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
          refuels: value!.refuels,
          services: value!.services,
          route: value!.route,
          income: value!.income,
          id: value!.id,
          expenses: temp,
        ));

    await setAllList();
  }

  Future<void> checkDeleteIncome(IncomeModel data) async {
    final box = await Hive.openBox<MainBoxUser>('user_box');
    final pref = await SharedPreferences.getInstance();
    final list = pref.getStringList(ConstName.carName);

    MainBoxUser? value;
    await Future.forEach(box.values, (element) {
      if (element.id == int.parse(list![1])) {
        value = element;
      }
    });

    int index = value!.income!.indexOf(data);
    List<IncomeModel> temp = value!.income!;

    temp.removeAt(index);

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
          refuels: value!.refuels,
          services: value!.services,
          route: value!.route,
          id: value!.id,
          expenses: value!.expenses,
          income: temp,
        ));

    await setAllList();
  }

  Future<void> checkDeleteService(ServiceModel data) async {
    final box = await Hive.openBox<MainBoxUser>('user_box');
    final pref = await SharedPreferences.getInstance();
    final list = pref.getStringList(ConstName.carName);

    MainBoxUser? value;
    await Future.forEach(box.values, (element) {
      if (element.id == int.parse(list![1])) {
        value = element;
      }
    });

    int index = value!.services!.indexOf(data);
    List<ServiceModel> temp = value!.services!;

    temp.removeAt(index);

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
          refuels: value!.refuels,
          route: value!.route,
          id: value!.id,
          expenses: value!.expenses,
          income: value!.income,
          services: temp,
        ));

    await setAllList();
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
