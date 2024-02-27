import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/widgets/car_detail_from_widget/car_details.dart';
import 'package:car_maintanance/widgets/current_car_widgets/background_image_widget.dart';
import 'package:flutter/material.dart';

class ShowCarDetails extends StatelessWidget {
  const ShowCarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          // Background Image Rising on TextField click time
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFF5F5F5),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                const BgImage(),
                Positioned(
                  left: ResSize.left03(context), // Adjusted for responsiveness
                  top: ResSize.top033(context),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
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
                        'Add Car',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: ResSize.left064(context), // Adjusted for responsiveness
                  top: ResSize.top1(context),
                  right: ResSize.right064(context),
                  bottom: ResSize.dotBottom02(context),
                  child: CarDetail(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
