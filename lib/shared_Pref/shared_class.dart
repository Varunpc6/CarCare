import 'dart:developer';
import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/presentation/bottom_nav_bar/first_screen/home_main_one/car_card/current_car_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  // Singleton pattern to ensure there's only one instance of SharedPref throughout the application
  SharedPref.internal();
  static SharedPref sharedVal = SharedPref.internal();
  factory SharedPref() {
    return sharedVal;
  }

  // Save the carBrand data to shared preferences
  Future<void> setCarBrand({required brandName, required String id}) async {
    try {
      // Get an Instance of SharedPreferences
      final SharedPreferences carActive = await SharedPreferences.getInstance();
      carActive.setStringList(ConstName.carName, [brandName, id]);
      //  NotifierListeners are notified of the change
      carNameNotifier.value = brandName;
      // carNameNotifier.notifyListeners();
      User().setAllList();
    } catch (e) {
      log('Error in carBrand function: $e');
    }
  }

  //  Retrieve the previously saved carBrand data from shared preferences
  Future<void> getCarBrand() async {
    try {
      final SharedPreferences carActive = await SharedPreferences.getInstance();
      if (carActive.getStringList(ConstName.carName) != null) {
        List<String>? data = carActive.getStringList(ConstName.carName);

        carNameNotifier.value = data![0];
      }
    } catch (e) {
      log('Error in carBrand function: $e');
      throw Exception(e);
    }
  }
}
