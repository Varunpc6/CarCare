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
        resizeToAvoidBottomInset:
            false, // Background Image Rising on TextField click time
        body: Center(
          child: Stack(
            children: [
              // Background Image
              _buildBackgroundImage(context),
              _buildFromContainer(context),
              // Circular Image
              _buildCircularImage(context),
              // Elevated button
              _buildElevatedButton(context),
            ],
          ),
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
  _buildFromContainer(BuildContext context) {
    return Stack(
      children: [
        // Container Hovering over the Image
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.1,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 68, 65, 65).withOpacity(0.5),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.orange,
                width: 2.0,
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
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xFFFB7E3C),
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
                          labelText: "Car name / no.plate",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xFFFB7E3C),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
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
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xFFFB7E3C),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
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
              left: MediaQuery.of(context).size.width * 0.35,
              top: MediaQuery.of(context).size.height * 0.08,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: const ShapeDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: CircleBorder(
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
      top: MediaQuery.of(context).size.height * 0.85,
      left: MediaQuery.of(context).size.width * 0.25,
      child: ElevatedButton(
        onPressed: () {
          onTapCreate(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 3,
          minimumSize: const Size(160, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Create',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  /// Navigates to the homeScreen and replaces the current route
  void onTapCreate(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
  }
}
