import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/db/db_functions/registor_from.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInScreen extends StatefulWidget {
  const UserInScreen({Key? key}) : super(key: key);

  @override
  State<UserInScreen> createState() => _UserInScreenState();
}

class _UserInScreenState extends State<UserInScreen> {
  // Dummy brand list for demonstration purpose
  List<String> brands = [
    'Brand',
    'Car 1',
    'Car 2',
    'Car 3',
    'Car 4',
    'Car 5',
    'Car 6',
  ];
  String? selectedBrand;

  // Text controller
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController carNameController = TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController modelNameController = TextEditingController();

  // DataBase instance
  final UserRegisterApp registerUser = UserRegisterApp();

  // TextField focus Auto jump
  FocusNode focusOne = FocusNode();
  FocusNode focusTwo = FocusNode();
  FocusNode focusThree = FocusNode();
  FocusNode focusFour = FocusNode();
  FocusNode focusBtn = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> savedUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("nameUser", userNameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          // Background Image Rising on TextField click time
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Stack(
              children: [
                // Background Image
                _buildBackgroundImage(context),
                // Content session
                _buildFromContainer(context),
                // Circular Image
                _buildCircularImage(context),
                // Elevated button
                _buildElevatedButton(context),
              ],
            ),
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
    return Form(
      key: _formKey,
      child: Stack(
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
                  color: const Color(0xFFFB7E3C),
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
                        // Username
                        TextFormField(
                          focusNode: focusOne,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(focusTwo);
                          },
                          controller: userNameController,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        // Carname / no.plate
                        TextFormField(
                          focusNode: focusTwo,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(focusThree);
                          },
                          controller: carNameController,
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
                              Icons.no_crash_sharp,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a car name or number plate';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        // Brand Dropdown
                        // Brand Dropdown with InputDecorator
                        InputDecorator(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.no_crash_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: "Brand",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFFFB7E3C),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFB7E3C),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFB7E3C),
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: DropdownButton<String>(
                            value: selectedBrand,
                            onChanged: (newValue) {
                              setState(() {
                                selectedBrand = newValue!;
                              });
                            },
                            items: brands.map((brand) {
                              return DropdownMenuItem<String>(
                                value: brand,
                                child: Text(
                                  brand,
                                  style: TextStyle(
                                      color: Colors.black), // Adjust text color
                                ),
                              );
                            }).toList(),
                            icon: Icon(Icons.arrow_drop_down,
                                color:
                                    Colors.black), // Adjust dropdown icon color
                            iconSize: 30,
                            underline: Container(), // Hide the underline
                            style: TextStyle(
                                color: Colors
                                    .black), // Adjust dropdown button text color
                            dropdownColor:
                                Colors.white, // Set dropdown background color
                          ),
                        ),

                        const SizedBox(height: 16.0),
                        // Model
                        TextFormField(
                          focusNode: focusFour,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(focusBtn);
                          },
                          controller: modelNameController,
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
                              Icons.menu_rounded,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a model name';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Round Image
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
                            spreadRadius: 3,
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

  // Button
  _buildElevatedButton(BuildContext context) {
    return Positioned(
      // Adjust this value as needed
      top: MediaQuery.of(context).size.height * 0.85 - 30,
      left: MediaQuery.of(context).size.width * 0.5 - 80,
      child: ElevatedButton(
        focusNode: focusBtn,
        onPressed: () {
          // Validate the form
          if (_formKey.currentState!.validate()) {
            // If the form is valid, proceed with form submission
            _formKey.currentState!.save(); // Optionally save form data
            // Database Insert
            final userName = userNameController.text.trim();
            final carName = carNameController.text.trim();
            final brandName = brandNameController.text.trim();
            final modelName = modelNameController.text.trim();

            // Call userRegisterAdd with parameter names
            registerUser.userRegisterAdd(
              userName: userName,
              carName: carName,
              brandName: brandName,
              modelName: modelName,
            );

            // Optionally, perform any additional actions
            savedUser();
            onTapCreate(context);
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          minimumSize: const Size(160, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Center(
          child: Text(
            'Create',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  // /// click Pop on Brand
  // onTapBrand(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text(
  //           "Distance in advance",
  //           style: TextStyle(color: Color.fromARGB(255, 252, 66, 9)),
  //         ),
  //         content: const TextField(),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context, 'Cancel'),
  //             child: const Text(
  //               'Cancel',
  //               style: TextStyle(color: Colors.black),
  //             ),
  //           ),
  //           TextButton(
  //             onPressed: () => Navigator.pop(context, 'OK'),
  //             child: const Text(
  //               'Ok',
  //               style: TextStyle(color: Color.fromARGB(236, 255, 0, 0)),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  /// Navigates to the homeScreen and replaces the current route
  void onTapCreate(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
  }
}
