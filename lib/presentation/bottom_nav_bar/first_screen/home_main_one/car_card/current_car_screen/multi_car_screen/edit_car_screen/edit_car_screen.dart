import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/presentation/bottom_nav_bar/first_screen/home_main_one/car_card/current_car_screen/bg_image_widget/background_image_widget.dart';
import 'package:car_maintanance/presentation/bottom_nav_bar/first_screen/home_main_one/car_card/current_car_screen/multi_car_screen/edit_car_screen/form_widget/my_form.dart';

import 'package:flutter/material.dart';

class EditCarScreen extends StatefulWidget {
  const EditCarScreen({super.key});

  @override
  State<EditCarScreen> createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCarScreen> {
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
                          // onTapNext(context);
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
                  child: MyForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
