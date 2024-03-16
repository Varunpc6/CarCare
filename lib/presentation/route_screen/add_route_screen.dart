import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/widgets/form/my_route_from.dart';
import 'package:flutter/material.dart';

class AddRoutePage extends StatelessWidget {
  const AddRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              // Background Image
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.currentCar),
                      fit: BoxFit
                          .fitWidth, // Use BoxFit.cover for a responsive background image
                    ),
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width *
                    0.06, // Adjusted for responsiveness
                top: MediaQuery.of(context).size.height * 0.033,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(width: 2.5, color: Colors.orange),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width *
                    0.25, // Adjusted for responsiveness
                top: MediaQuery.of(context).size.height * 0.04,
                child: const Row(
                  children: [
                    Text(
                      Constants.route,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width * 0.06,
                left: MediaQuery.of(context).size.width *
                    0.06, // Adjusted for responsiveness
                top: MediaQuery.of(context).size.height * 0.10,
                child: const MyRoteForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
