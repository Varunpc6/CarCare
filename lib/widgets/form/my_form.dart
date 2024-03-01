import 'dart:io';

import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:car_maintanance/src/list/fuel_items.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_brand_dropdown.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_dropdown.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  MyForm({Key? key}) : super(key: key);
  // TextField focus Auto jump
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode7 = FocusNode();
  final FocusNode _focusNode8 = FocusNode();
  final FocusNode _focusNodeBtn = FocusNode();
  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  bool showMainTank = false;
  String? selectedBrand;
  String? selectedValue;
  String? selectedValue2;

  // // DataBase instance
  // final User registerdCar = User();

  // Text Controller
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();

  // From field
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // void saveFormDataToHive() async {
  //   final carName = _controller1.text.trim();
  //   final brandName = selectedBrand!;
  //   final modelName = _controller3.text.trim();
  //   final fuelType = _controller4.text.trim();
  //   final fuelCapacity = _controller5.text.trim();
  //   final sFuelType = _controller6.text.trim();
  //   final sFuelCapacity = _controller7.text.trim();
  //   final note = _controller8.text.trim();

  //   // Call the addCarRegister function
  //   await registerdCar.userAdd(
  //     carName: carName,
  //     brandName: brandName,
  //     modelName: modelName,
  //     fuel: fuelType,
  //     fuelCapacity: fuelCapacity,
  //     sFuel: sFuelType,
  //     sFuelCapacity: sFuelCapacity,
  //     note: note,
  //   );
  // }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _controller8.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Car name
                  CustomTextField(
                    controller: _controller1,
                    focusNode: widget._focusNode1,
                    prefixIcon: Icons.car_rental,
                    labelText: 'Car name',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a car name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  // Dropdown brand
                  BrandDropdown(
                    selectedBrand: selectedBrand,
                    onChanged: (newValue) {
                      setState(() {
                        selectedBrand = newValue!;
                      });
                    },
                    focusNode: widget._focusNode2,
                    controller:
                        _controller2, // Pass your TextEditingController here
                  ),
                  const SizedBox(height: 12.0),
                  // Model
                  CustomTextField(
                    controller: _controller3,
                    focusNode: widget._focusNode3,
                    prefixIcon: Icons.oil_barrel_outlined,
                    labelText: 'Model',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a model';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  // Main Tank
                  const Text(
                    'MAIN TANK',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        // Dropdown FuelType
                        child: CustomDropdown(
                          items: items,
                          selectedValue: selectedValue,
                          prefixIcon: Icons.menu_outlined,
                          labelText: 'Fuel type',
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        // FuelCapacity
                        child: CustomTextField(
                          controller: _controller5,
                          focusNode: widget._focusNode5,
                          prefixIcon: Icons.category,
                          labelText: 'Fuel Capaity',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Fuel Capacity';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  // Secondary Tank
                  Row(
                    children: [
                      const Text(
                        'SECONDARY TANK',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Checkbox(
                        value: showMainTank,
                        onChanged: (value) {
                          setState(() {
                            showMainTank = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                  if (showMainTank) ...[
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdown(
                            items: items,
                            selectedValue:
                                items.first, // Set the initial selected value
                            prefixIcon: Icons.menu_outlined,
                            labelText: 'Fuel type',
                            onChanged: (newValue) {
                              // Handle the onChanged event here
                              stdout.write('Selected fuel type: $newValue');
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          // Fuel Capacity
                          child: CustomTextField(
                            controller: _controller7,
                            focusNode: widget._focusNode7,
                            prefixIcon: Icons.category,
                            labelText: 'Fuel Capaity',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Fuel Capacity';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 15.0),
                  // Note
                  CustomTextField(
                    controller: _controller8,
                    focusNode: widget._focusNode8,
                    prefixIcon: Icons.note,
                    labelText: 'Note',
                  ),
                  const SizedBox(height: 80.0),
                ],
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                focusNode: widget._focusNodeBtn,
                onPressed: () async {
                  onTapNext(context); // **********NewAdded*****************
                  // if (_formKey.currentState!.validate()) {
                  //   // Validate dropdown selection
                  //   if (selectedBrand == 'Brand' || selectedBrand!.isEmpty) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(
                  //         content: Text('Please select a brand'),
                  //       ),
                  //     );
                  //   } else {
                  //     if (!showMainTank ||
                  //         (showMainTank && _controller7.text.isNotEmpty)) {
                  //       final carName = _controller1.text.trim();
                  //       final brandName = selectedBrand!;
                  //       final modelName = _controller3.text.trim();
                  //       final fuelM = selectedValue!;
                  //       final fuelCapacityM = _controller5.text.trim();
                  //       final fuelS = items.first;
                  //       final fuelCapacityS = _controller7.text.trim();
                  //       final note = _controller8.text.trim();

                  //       // Call userRegisterAdd with parameter names
                  //       await registerdCar.userAdd(
                  //         carName: carName,
                  //         brandName: brandName,
                  //         modelName: modelName,
                  //         fuel: fuelM,
                  //         fuelCapacity: fuelCapacityM,
                  //         sFuel: fuelS,
                  //         sFuelCapacity: fuelCapacityS,
                  //         note: note,
                  //       );
                  //       // ignore: use_build_context_synchronously
                  //       onTapNext(context);
                  //     } else {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(
                  //           content: Text(
                  //               'Please enter secondary tank fuel capacity'),
                  //         ),
                  //       );
                  //     }
                  //   }
                  // }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Radius
                  ),
                  minimumSize: const Size(500, 55), // Width and height
                  backgroundColor: AppColors.orange,
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // /// Navigates to the homeScreen and replaces the current route
  // void onTap(BuildContext context) {
  //   Navigator.pop(context);
  // }

  /// click Next Button
  onTapNext(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.currentCarScreen);
  }
}
