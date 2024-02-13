import 'package:car_maintanance/db/db_functions/registor_from.dart';
import 'package:car_maintanance/page_session/user_in_screen/background_image.dart';
import 'package:car_maintanance/page_session/user_in_screen/circular_image.dart';
import 'package:car_maintanance/page_session/user_in_screen/text_field_model.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInScreen extends StatefulWidget {
  const UserInScreen({Key? key}) : super(key: key);

  @override
  State<UserInScreen> createState() => _UserInScreenState();
}

class _UserInScreenState extends State<UserInScreen> {
  //  Brand
  List<String> brands = [
    'Brand',
    'AstonMartin',
    'Audi',
    'BMW',
    'Bentley',
    'Chevrolet',
    'Ferrari',
    'Fiat',
    'Ford',
    'Honda',
    'Hyundai',
    'Jaguar',
    'Kia',
    'LandRover',
    'Lamborghini',
    'Lexus',
    'MahindraAndMahindra',
    'Maserati',
    'MercedesBenz',
    'Nissan',
    'Porsche',
    'Renault',
    'RollsRoyce',
    'Skoda',
    'Tata Motors',
    'Toyota',
    'Volkswagen',
    'Volvo',
    'Other',
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

  // From field
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // SharedPrefernceAdd
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
                buildBackgroundImage(context),
                // Content session
                buildFromContainer(context),
                // Circular Image
                buildCircularImage(context),
                // Elevated button
                _buildElevatedButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // User Interface
  buildFromContainer(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          // Container Hovering over the Image
          Positioned(
            top: MediaQuery.of(context).size.height * 0.20,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.54,
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
                        // UserName
                        customTextFormField(
                          controller: userNameController,
                          labelText: "Username",
                          prefixIcon: Icons.person,
                          focusNode: focusOne,
                          nextFocusNode: focusTwo,
                          context: context,
                        ),
                        const SizedBox(height: 16.0),
                        // Car number
                        customTextFormField(
                          controller: carNameController,
                          labelText: "Car Name",
                          prefixIcon: Icons.directions_car,
                          focusNode: focusTwo,
                          nextFocusNode: focusThree,
                          context: context,
                        ),
                        // Brand Dropdown
                        InputDecorator(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.no_crash_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
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
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Column(
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Brand', // Change the hint text here
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                            255,
                                            255,
                                            255,
                                            255,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              items: brands.map((brand) {
                                return DropdownMenuItem<String>(
                                  value: brand,
                                  child: Text(
                                    brand,
                                    style: const TextStyle(
                                      color: Color.fromARGB(250, 26, 25, 25),
                                    ),
                                  ),
                                );
                              }).toList(),
                              value: selectedBrand,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedBrand = newValue!;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 200,
                                elevation: 0,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                elevation: 2,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(201, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                              dropdownSearchData: DropdownSearchData(
                                searchController: brandNameController,
                                searchInnerWidgetHeight: 50,
                                searchInnerWidget: Container(
                                  height: 50,
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 4,
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: TextFormField(
                                    focusNode: focusThree,
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(focusFour);
                                    },
                                    expands: true,
                                    maxLines: null,
                                    controller: brandNameController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Search for a brand...',
                                      hintStyle: const TextStyle(fontSize: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                searchMatchFn: (item, searchValue) {
                                  return item.value
                                      .toString()
                                      .contains(searchValue);
                                },
                              ),
                              onMenuStateChange: (isOpen) {
                                if (!isOpen) {
                                  brandNameController.clear();
                                }
                              },
                              // Define selectedItemBuilder to set the style of the selected value
                              selectedItemBuilder: (BuildContext context) {
                                return brands.map<Widget>((String value) {
                                  return Text(
                                    value,
                                    style: const TextStyle(
                                      height: 2.2,
                                      color: Colors.white,
                                    ), // Set the color of the selected value
                                  );
                                }).toList();
                              },
                              barrierLabel:
                                  'Select Brand', // Adding barrier label
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Model
                        customTextFormField(
                          controller: modelNameController,
                          labelText: "Model",
                          prefixIcon: Icons.menu_rounded,
                          focusNode: focusFour,
                          nextFocusNode: focusBtn,
                          context: context,
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

  // Button
  _buildElevatedButton(BuildContext context) {
    return Positioned(
      // Adjust this value as needed
      top: MediaQuery.of(context).size.height * 0.85 - 30,
      left: MediaQuery.of(context).size.width * 0.5 - 80,
      child: ElevatedButton(
        focusNode: focusBtn,
        onPressed: () async {
          // Validate the form
          if (_formKey.currentState!.validate()) {
            // Check if a brand has been selected
            if (selectedBrand != null && selectedBrand != 'Brand') {
              // If the form is valid and a brand has been selected, proceed with form submission
              _formKey.currentState!.save(); // Optionally save form data

              final userName = userNameController.text.trim();
              final carName = carNameController.text.trim();
              final brandName = selectedBrand!;
              final modelName = modelNameController.text.trim();

              // Call userRegisterAdd with parameter names
              await registerUser.userRegisterAdd(
                userName: userName,
                carName: carName,
                brandName: brandName,
                modelName: modelName,
              );

              // Optionally, perform any additional actions
              savedUser();
              onTapCreate(context);
            } else {
              // If no brand has been selected, show an error message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Please select a brand'),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Please fill in the form'),
              ),
            );
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

  /// Navigates to the homeScreen and replaces the current route
  void onTapCreate(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
  }
}

//=========================================================
//------TextField---------------
// Username
// TextFormField(
//   focusNode: focusOne,
//   onFieldSubmitted: (value) {
//     FocusScope.of(context).requestFocus(focusTwo);
//   },
//   controller: userNameController,
//   decoration: const InputDecoration(
//     focusedBorder: UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Color(0xFFFB7E3C),
//         width: 2.0,
//       ),
//     ),
//     enabledBorder: UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Color(0xFFFB7E3C),
//         width: 2.0,
//       ),
//     ),
//     prefixIcon: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           width: 10,
//         ),
//         Icon(
//           Icons.person,
//           color: Colors.white,
//           size: 30,
//         ),
//         SizedBox(
//           width: 25,
//         ), // Adjust the space between icon and text
//       ],
//     ),
//     filled: true,
//     fillColor: Colors.transparent,
//     labelText: "Username",
//     labelStyle: TextStyle(
//       color: Colors.white,
//     ),
//     hintStyle: TextStyle(
//       color: Color(0xFFFB7E3C),
//     ),
//   ),
//   style: const TextStyle(
//     color: Colors.white,
//   ),
//   validator: (value) {
//     if (value!.isEmpty) {
//       return 'Please enter a username';
//     }
//     return null;
//   },
// ),

// const SizedBox(height: 16.0),
// // Carname / no.plate
// TextFormField(
//   focusNode: focusTwo,
//   onFieldSubmitted: (value) {
//     FocusScope.of(context).requestFocus(focusThree);
//   },
//   controller: carNameController,
//   decoration: const InputDecoration(
//     focusedBorder: UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Color(0xFFFB7E3C),
//         width: 2.0,
//       ),
//     ),
//     enabledBorder: UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Color(0xFFFB7E3C),
//         width: 2.0,
//       ),
//     ),
//     prefixIcon: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           width: 10,
//         ),
//         Icon(
//           Icons.no_crash_sharp,
//           color: Colors.white,
//           size: 30,
//         ),
//         SizedBox(
//             width:
//                 25), // Adjust the space between icon and text
//       ],
//     ),
//     filled: true,
//     fillColor: Colors.transparent,
//     labelText: "Car name / no.plate",
//     labelStyle: TextStyle(
//       color: Colors.white,
//     ),
//     hintStyle: TextStyle(
//       color: Color(0xFFFB7E3C),
//     ),
//   ),
//   style: const TextStyle(
//     color: Colors.white,
//   ),
//   validator: (value) {
//     if (value!.isEmpty) {
//       return 'Please enter a car name or number plate';
//     }
//     return null;
//   },
// ),
// const SizedBox(height: 16.0),
// // Brand Dropdown
// InputDecorator(
//   decoration: const InputDecoration(
//     prefixIcon: Icon(
//       Icons.no_crash_sharp,
//       color: Colors.white,
//       size: 30,
//     ),
//     filled: true,
//     fillColor: Colors.transparent,
//     enabledBorder: UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Color(0xFFFB7E3C),
//         width: 2.0,
//       ),
//     ),
//     focusedBorder: UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Color(0xFFFB7E3C),
//         width: 2.0,
//       ),
//     ),
//   ),
//   child: DropdownButtonHideUnderline(
//     child: DropdownButton2<String>(
//       isExpanded: true,
//       hint: const Column(
//         children: [
//           SizedBox(
//             height: 12,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 'Brand', // Change the hint text here
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Color.fromARGB(
//                     255,
//                     255,
//                     255,
//                     255,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       items: brands.map((brand) {
//         return DropdownMenuItem<String>(
//           value: brand,
//           child: Text(
//             brand,
//             style: const TextStyle(
//               color: Color.fromARGB(250, 26, 25, 25),
//             ),
//           ),
//         );
//       }).toList(),
//       value: selectedBrand,
//       onChanged: (newValue) {
//         setState(() {
//           selectedBrand = newValue!;
//         });
//       },
//       buttonStyleData: const ButtonStyleData(
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         height: 40,
//         width: 200,
//         elevation: 0,
//       ),
//       dropdownStyleData: DropdownStyleData(
//         maxHeight: 200,
//         elevation: 2,
//         decoration: BoxDecoration(
//           color:
//               const Color.fromARGB(201, 255, 255, 255),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       menuItemStyleData: const MenuItemStyleData(
//         height: 40,
//       ),
//       dropdownSearchData: DropdownSearchData(
//         searchController: brandNameController,
//         searchInnerWidgetHeight: 50,
//         searchInnerWidget: Container(
//           height: 50,
//           padding: const EdgeInsets.only(
//             top: 8,
//             bottom: 4,
//             right: 8,
//             left: 8,
//           ),
//           child: TextFormField(
//             focusNode: focusThree,
//             onFieldSubmitted: (value) {
//               FocusScope.of(context)
//                   .requestFocus(focusFour);
//             },
//             expands: true,
//             maxLines: null,
//             controller: brandNameController,
//             decoration: InputDecoration(
//               isDense: true,
//               contentPadding:
//                   const EdgeInsets.symmetric(
//                 horizontal: 10,
//                 vertical: 8,
//               ),
//               hintText: 'Search for a brand...',
//               hintStyle: const TextStyle(fontSize: 12),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             style: const TextStyle(color: Colors.black),
//           ),
//         ),
//         searchMatchFn: (item, searchValue) {
//           return item.value
//               .toString()
//               .contains(searchValue);
//         },
//       ),
//       onMenuStateChange: (isOpen) {
//         if (!isOpen) {
//           brandNameController.clear();
//         }
//       },
//       // Define selectedItemBuilder to set the style of the selected value
//       selectedItemBuilder: (BuildContext context) {
//         return brands.map<Widget>((String value) {
//           return Text(
//             value,
//             style: const TextStyle(
//               height: 2.2,
//               color: Colors.white,
//             ), // Set the color of the selected value
//           );
//         }).toList();
//       },
//       barrierLabel:
//           'Select Brand', // Adding barrier label
//     ),
//   ),
// ),
// const SizedBox(height: 16.0),
// // Model
// TextFormField(
//   focusNode: focusFour,
//   onFieldSubmitted: (value) {
//     FocusScope.of(context).requestFocus(focusBtn);
//   },
//   controller: modelNameController,
//   decoration: const InputDecoration(
//     focusedBorder: UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Color(0xFFFB7E3C),
//         width: 2.0,
//       ),
//     ),
//     enabledBorder: UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Color(0xFFFB7E3C),
//         width: 2.0,
//       ),
//     ),
//     prefixIcon: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           width: 10,
//         ),
//         Icon(
//           Icons.menu_rounded,
//           color: Colors.white,
//           size: 30,
//         ),
//         SizedBox(
//           width: 25,
//         ),
//       ],
//     ),
//     filled: true,
//     fillColor: Colors.transparent,
//     labelText: "Model",
//     labelStyle: TextStyle(
//       color: Colors.white,
//     ),
//     hintStyle: TextStyle(
//       color: Color(0xFFFB7E3C),
//     ),
//   ),
//   style: const TextStyle(
//     color: Colors.white,
//   ),
//   validator: (value) {
//     if (value!.isEmpty) {
//       return 'Please enter a model name';
//     }
//     return null;
//   },
// ),
