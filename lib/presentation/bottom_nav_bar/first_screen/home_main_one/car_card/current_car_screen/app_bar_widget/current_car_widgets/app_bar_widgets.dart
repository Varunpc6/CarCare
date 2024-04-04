import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:flutter/material.dart';

class AppBarCurrentSrn extends StatelessWidget {
  const AppBarCurrentSrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: ResSize.left03(context), // Adjusted for responsiveness
      top: ResSize.top033(context),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.pop(context);
              onTap(context);
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: AppColors.white,
                border: Border.all(
                  width: 2.5,
                  color: AppColors.orange,
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          const Text(
            ConstName.carDetails,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  // click Next Button
  onTap(BuildContext context) {
    Navigator.pop(context);
  }
}
