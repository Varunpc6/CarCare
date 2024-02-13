import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CurrentCarScreen extends StatelessWidget {
  const CurrentCarScreen({Key? key}) : super(key: key);

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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(width: 2.5, color: Colors.orange)),
                      child: const Icon(Icons.arrow_back, color: Colors.black)),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width *
                    0.25, // Adjusted for responsiveness
                top: MediaQuery.of(context).size.height * 0.04,
                child: const Row(
                  children: [
                    Text(
                      'Car Details',
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
                top: MediaQuery.of(context).size.height * 0.15,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjusted for responsiveness
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 242, 246, 250),
                      hintText: 'Search',
                      hintStyle:
                          const TextStyle(color: Color.fromARGB(117, 0, 0, 0)),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                left: MediaQuery.of(context).size.width *
                    0.06, // Adjusted for responsiveness
                right: MediaQuery.of(context).size.width * 0.06,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjusted for responsiveness
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.9, // Adjusted for responsiveness
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  Colors.orange), // Border color set to orange
                          borderRadius:
                              BorderRadius.circular(10.0), // Adjust as needed
                          color: const Color.fromARGB(
                              208, 242, 242, 242), // Background color
                        ),
                        child: const Center(
                          child: ListTile(
                            leading: Icon(
                              Icons.directions_car,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Car Model Name',
                              style: TextStyle(
                                color: Color.fromARGB(225, 43, 26, 0),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           Navigator.of(context).pushNamed(AppRoutes.editCarScreen);
          },
          child: const Icon(
            Icons.directions_car_sharp,
            size: 26,
            color: Colors.orange,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
