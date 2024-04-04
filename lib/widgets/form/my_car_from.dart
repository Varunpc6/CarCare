import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:car_maintanance/src/list/fuel_items.dart';
import 'package:car_maintanance/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_dropdown.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_textfield.dart';
import 'package:car_maintanance/widgets/home_screen/car_card/current_car_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCarForm extends StatefulWidget {
  const MyCarForm({Key? key}) : super(key: key);

  @override
  MyCarFormState createState() => MyCarFormState();
}

class MyCarFormState extends State<MyCarForm> {
  List<String> carData = [];
  String? selectedValue;
  String? selectedvalu2;

  // DataBase instance
  final User refuleRefule = User();

  // From field
  final GlobalKey<FormState> _formKeyRe = GlobalKey<FormState>();

  late TextEditingController dateController1 = TextEditingController();
  late TextEditingController timeController2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  final FocusNode _focusNodeBtn = FocusNode();

  @override
  void initState() {
    super.initState();
    // Initialize the dateController with the current date
    dateController1 = TextEditingController(text: _formatDate(DateTime.now()));
    timeController2 =
        TextEditingController(text: DateFormat.jm().format(DateTime.now()));
  }

  Future<int> getCarData() async {
    SharedPreferences carActive = await SharedPreferences.getInstance();
    List<String>? storedData = carActive.getStringList(ConstName.carName);
    if (storedData != null) {
      setState(() {
        carData = storedData;
      });
    }
    return int.parse(carData[1]);
  }

  @override
  void dispose() {
    dateController1.dispose();
    timeController2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _controller8.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    super.dispose();
  }

  // Function to format the date as per requirement
  String _formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  // Function to format the time as per requirement
  String format(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyRe,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //-*-----------------------------*-
            // Text(
            //   carNameNotifier.value,
            //   style: TextStyle(color: AppColors.red),
            // ),
            //-*-----------------------------*-
            Row(
              children: [
                Expanded(
                  // Date Picker
                  child: MyDropdownField(
                    controller: dateController1,
                    focusNode: FocusNode(),
                    icon: Icons.calendar_today,
                    labelText: ConstName.date,
                    fieldType: FieldType.datePicker,
                    onDateSelected: (DateTime selectedDate) {
                      // Update the date controller with the selected date
                      setState(() {
                        dateController1.text = _formatDate(selectedDate);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: MyDropdownField(
                    controller: timeController2,
                    focusNode: _focusNode2,
                    icon: Icons.access_time,
                    labelText: ConstName.time,
                    fieldType: FieldType.timePicker,
                    onUpdateControllerText: (String formattedTime) {
                      setState(() {
                        timeController2.text = formattedTime;
                      });
                    },
                  ),
                ),
              ],
            ),
            // Odometer
            CustomTextField(
              controller: _controller3,
              focusNode: _focusNode1,
              keyboardType: TextInputType.number,
              prefixIcon: Icons.car_rental,
              labelText: ConstName.odometer,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Odometer';
                }
                return null;
              },
            ),
            const SizedBox(height: 6.0),
            // Fuel
            CustomDropdown(
              items: items,
              selectedValue: selectedValue,
              prefixIcon: Icons.menu_outlined,
              labelText: ConstName.fuletype,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
            ),
            // Price & Total Cost & Gallons
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _controller4,
                    focusNode: _focusNode2,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.car_rental,
                    labelText: ConstName.price,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Price';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: CustomTextField(
                    controller: _controller5,
                    focusNode: _focusNode3,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.car_rental,
                    labelText: ConstName.totalCost,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Total price';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: CustomTextField(
                    controller: _controller6,
                    focusNode: _focusNode4,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.car_rental,
                    labelText: ConstName.gallon,
                  ),
                ),
              ],
            ),
            // Gas station
            CustomTextField(
              controller: _controller7,
              focusNode: _focusNode5,
              prefixIcon: Icons.attach_money,
              labelText: ConstName.gasStation,
            ),
            const SizedBox(height: 6.0),
            // Payment method
            CustomDropdown(
              items: cashM,
              selectedValue: selectedvalu2,
              prefixIcon: Icons.menu_outlined,
              labelText: ConstName.paymentMethod,
              onChanged: (newValue) {
                setState(() {
                  selectedvalu2 = newValue;
                });
              },
            ),
            // Rason
            CustomTextField(
              controller: _controller8,
              focusNode: _focusNode6,
              prefixIcon: Icons.attach_money,
              labelText: ConstName.reason,
            ),
            const SizedBox(height: 25.0),
            // Button
            ElevatedButton(
              focusNode: _focusNodeBtn,
              onPressed: () async {
                // Validate the form
                if (_formKeyRe.currentState!.validate()) {
                  _formKeyRe.currentState!.save(); // Optionally save form data
                  final date = dateController1.text;
                  final time = timeController2.text;
                  final odometer = _parseToInt(_controller3.text.trim());
                  final typeFuel = selectedValue;
                  final price = _parseToInt(_controller4.text.trim());
                  final gasStation = _controller7.text;
                  final paymentMethod = selectedvalu2;
                  final reason = _controller5.text.trim();

                  // Create an instance of MainBoxUser with updated data
                  final updatedRefuel = RefuelModel(
                    date: date,
                    time: time,
                    odometer: odometer,
                    typeFuel: typeFuel,
                    price: price,
                    gasStation: gasStation,
                    paymentMethod: paymentMethod,
                    reason: reason,
                  );

                  // adding the Data
                  await refuleRefule.updateUserRefuel(updatedRefuel);

                  // Navigation to the next page
                  // ignore: use_build_context_synchronously
                  tapBtn(context);
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Radius
                ),
                minimumSize: const Size(500, 60), // Width and height
                backgroundColor: AppColors.orange,
              ),
              child: const Text(
                ConstName.done,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Add a method to parse string to int safely
  int _parseToInt(String value) {
    return int.tryParse(value) ?? 0; // Return 0 if parsing fails
  }

  void tapBtn(BuildContext context) {
    // Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    Navigator.of(context).pop();
  }
}
