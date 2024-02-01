import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/routes/app_routes.dart';

import 'package:flutter/material.dart';

class UserInScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();

  UserInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Background Image
            _buildBackgroundImage(context),
            _buildFromContainer(),
            // Circular Image
            _buildCircularImage(context),
            // Elevated button
            _buildElevatedButton(context),
          ],
        ),
      ),
    );
  }

  // Background Image
  _buildBackgroundImage(BuildContext context) {
    return Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.imgUserIn),
            fit: BoxFit
                .cover, // Use BoxFit.cover for a responsive background image
          ),
        ),
      ),
    );
  }

  // User Interface
  _buildFromContainer() {
    return Stack(
      children: [
        // Container Hovering over the Image
        Positioned(
          top: 115,
          left: 30,
          child: Container(
            width: 300,
            height: 450,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 68, 65, 65).withOpacity(0.5),
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the radius as needed
              border: Border.all(
                color: Colors.orange, // Set the border color to orange
                width: 2.0, // Set the border width as needed
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFB7E3C),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFB7E3C),
                              width: 2.0,
                            ),
                          ),
                          // Person icon
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color: Colors
                                .white, // Color of the label when not focused
                          ),
                          // Customize the hint label style when focused
                          hintStyle: TextStyle(
                            color: Color(0xFFFB7E3C), // Set the hint text color
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white, // Set the initial text color
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFB7E3C),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFB7E3C),
                              width: 2.0,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText: "Car name / no.plate",
                          labelStyle: TextStyle(
                            color: Colors
                                .white, // Color of the label when not focused
                          ),
                          // Customize the hint label style when focused
                          hintStyle: TextStyle(
                            color: Color(0xFFFB7E3C), // Set the hint text color
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white, // Set the initial text color
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFB7E3C),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFB7E3C),
                              width: 2.0,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText: "Brand",
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(
                            color: Color(0xFFFB7E3C),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.info,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              // Pass the context to _showSimpleDialog
                            },
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFB7E3C),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFB7E3C),
                              width: 2.0,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText: "Model",
                          labelStyle: TextStyle(
                            color: Colors
                                .white, // Color of the label when not focused
                          ),
                          // Customize the hint label style when focused
                          hintStyle: TextStyle(
                            color: Color(0xFFFB7E3C), // Set the hint text color
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white, // Set the initial text color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildCircularImage(BuildContext context) {
    return Positioned(
      child: SizedBox(
        child: Stack(
          children: [
            Positioned(
              left: 130,
              top: 70,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.height * 0.40,
                      decoration: const ShapeDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 2,
                            color: Color(0xFFFB7E3C),
                          ),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 12,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      // Rotated Image
                      child: ClipOval(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.21,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage(ImageConstant.imgFreeHdconvertCom),
                              fit: BoxFit.fitWidth,
                            ),
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
    );
  }

  _buildElevatedButton(BuildContext context) {
    return Positioned(
      top: 610,
      left: 100,
      child: ElevatedButton(
        onPressed: () {
          onTapCreate(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 3, // Customize the elevation
          minimumSize: const Size(160, 60), // Customize the button size
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Customize the border radius
          ),
        ),
        child: const Text(
          'Create',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  /// Navigates to the homeScreen
  onTapCreate(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }
}
