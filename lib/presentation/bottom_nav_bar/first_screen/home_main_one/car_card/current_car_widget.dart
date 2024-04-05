import 'dart:developer';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarCard extends StatefulWidget {
  const CarCard({Key? key}) : super(key: key);

  @override
  State<CarCard> createState() => _CarCardState();
}

// Globel type ValueNotifier for CarName Showing the Homepage
ValueNotifier<String> carNameNotifier = ValueNotifier<String>('');

class _CarCardState extends State<CarCard> {
  String? carName;

  @override
  void initState() {
    super.initState();
    // Call the function to fetch and show carName
    showCarName();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CarListCurrentSn and wait for the result
        onTapNext(context);
      },
      child: ValueListenableBuilder(
        valueListenable: carNameNotifier,
        builder: (BuildContext context, dynamic val, Widget? _) {
          return Container(
            width: 150,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3, color: AppColors.ornages500),
                    color: AppColors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      ImageConstant.defaultImage,
                      width: 38,
                      height: 38,
                      fit: BoxFit.cover, // Adjust BoxFit as needed
                    ),
                  ),
                ),
                // Display carName fetched from SharedPreferences
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 46, maxWidth: 60),
                  child: Text(
                    val,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 26,
                  color: AppColors.white1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

 

  Future<void> showCarName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey("carName")) {
        List<String>? data = prefs.getStringList("carName");
        if (data != null && data.length > 1) {
          carNameNotifier.value = data[1]; // Accessing the second element
        } else {
          log('Error: No or insufficient data found in shared preferences');
        }
      }
      // else {
      //   await firstCar();
      // }
    } catch (e) {
      log('Error in showCarName function: $e');
    }
  }

  

  /// click Next Button
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.currentCarScreen);
  }
}
