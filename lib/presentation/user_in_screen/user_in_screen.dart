import 'dart:developer';

import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/page_session/user_in_screen/background_image.dart';
import 'package:car_maintanance/page_session/user_in_screen/circular_image.dart';
import 'package:car_maintanance/page_session/user_in_screen/text_field_model.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:car_maintanance/widgets/home_screen/car_card/current_car_widget.dart';
import 'package:car_maintanance/widgets/on_bording_screens/box_decoration_widget.dart';
import 'package:car_maintanance/widgets/user_in_widget/user_in_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInScreen extends StatefulWidget {
  const UserInScreen({Key? key}) : super(key: key);

  @override
  State<UserInScreen> createState() => _UserInScreenState();
}

class _UserInScreenState extends State<UserInScreen> {
  String? selectedBrand;

  // DataBase instance
  final User registerUser = User();

  // Text controller
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController carNameController = TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController modelNameController = TextEditingController();

  // TextField focus Auto jump
  FocusNode focusOne = FocusNode();
  FocusNode focusTwo = FocusNode();
  FocusNode focusThree = FocusNode();
  FocusNode focusFour = FocusNode();
  FocusNode focusBtn = FocusNode();

  // From field
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // SharedPrefernceAdd in Login Setup
  Future<void> savedUser({required brandName}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // -for Login time-
    await prefs.setString("nameUser", userNameController.text);
    // -first car Activation-
    await prefs.setStringList(Constants.firtCar, ['1', brandName]);

    carNameNotifier.value = brandName;
    carNameNotifier.notifyListeners();

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
            top: ResSize.top20(context),
            left: ResSize.left05(context),
            bottom: ResSize.dotBottom4(context),
            child: Container(
              width: ResSize.width8(context),
              height: ResSize.height55(context),
              decoration: AppDecorations.customDecoration, // decoration widget
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
                        const SizedBox(height: 16.0),
                        // Brand Dropdown
                        InputDecorator(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.no_crash_sharp,
                              color: AppColors.white,
                              size: 30,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primary,
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
                                          color: AppColors.ddownBg,
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
                                      color: AppColors.txtColor,
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
                                  color: AppColors.dpdBg,
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
                                    style: const TextStyle(
                                      color: AppColors.black,
                                    ),
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
                                      color: AppColors.white,
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
      top: ResSize.top8(context),
      left: ResSize.left3(context),
      bottom: ResSize.dotBottom19(context),
      right: ResSize.right30(context),
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
              await registerUser.userAdd(
                userName: userName,
                carName: carName,
                brandName: brandName,
                modelName: modelName,
              );

              // Optionally, perform any additional actions
              savedUser(brandName: brandName);

              // ignore: use_build_context_synchronously
              onTapCreate(context);
            } else {
              // If no brand has been selected, show an error message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: AppColors.red,
                  content: Text('Please select a brand'),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AppColors.red,
                content: Text('Please fill in the form'),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColors.orange),
        child: const Center(
          child: Text(
            'Create',
            style: TextStyle(
              color: AppColors.white,
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
