import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapNext(context);
      },
      child: Container(
        width: 125,
        height: 45,
        decoration: BoxDecoration(
            color: AppColors.orange, borderRadius: BorderRadius.circular(30)),
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
                  ImageConstant.bmw,
                  width: 38,
                  height: 38,
                  fit: BoxFit.cover, // Adjust BoxFit as needed
                ),
              ),
            ),
            const Text(
              ' BMW ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.white1,
                fontSize: 14,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 26,
              color: AppColors.white1,
            )
          ],
        ),
      ),
    );
  }

  /// click Next Button
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.currentCarScreen);
  }
}
