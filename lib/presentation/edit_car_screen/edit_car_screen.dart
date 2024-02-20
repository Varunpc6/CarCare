import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/widgets/current_car_widgets/background_image_widget.dart';
import 'package:car_maintanance/widgets/form/my_form.dart';

import 'package:flutter/material.dart';

class EditCarScreen extends StatelessWidget {
  const EditCarScreen({super.key});

  // //  Brand
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Background Image Rising on TextField click time
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF5F5F5),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              // Background Image
              // Positioned(
              //   left: 0,
              //   top: 0,
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height,
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage(ImageConstant.currentCar),
              //         fit: BoxFit
              //             .fitWidth, // Use BoxFit.cover for a responsive background image
              //       ),
              //     ),
              //   ),
              // ),
              const BgImage(),
              // Positioned(
              //   left: MediaQuery.of(context).size.width *
              //       0.06, // Adjusted for responsiveness
              //   top: MediaQuery.of(context).size.height * 0.033,
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.pop(context);
              //     },
              //     child: Container(
              //         width: 35,
              //         height: 35,
              //         decoration: BoxDecoration(
              //             borderRadius:
              //                 const BorderRadius.all(Radius.circular(50)),
              //             color: const Color.fromARGB(255, 255, 255, 255),
              //             border: Border.all(width: 2.5, color: Colors.orange)),
              //         child: const Icon(Icons.arrow_back, color: Colors.black)),
              //   ),
              // ),
              // Positioned(
              //   left: MediaQuery.of(context).size.width *
              //       0.25, // Adjusted for responsiveness
              //   top: MediaQuery.of(context).size.height * 0.04,
              //   child: const Row(
              //     children: [
              //       Text(
              //         'Add Car',
              //         style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 18.0,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
                child: const MyForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
