import 'dart:developer';

import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecUser extends User {
  SecUser() : super.internal();

  // Total Odometer
  Future<int> getTotalRefuelPrice() async {
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
      sum = sum + element.totalCost!;
    });

    log(sum.toString());
    return sum;
  }
}
