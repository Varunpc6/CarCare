import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/route_db/route_db.dart';
import 'package:car_maintanance/src/list/fuel_items.dart';
import 'package:car_maintanance/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_dropdown.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyRoteForm extends StatefulWidget {
  const MyRoteForm({Key? key}) : super(key: key);

  @override
  MyRoteFormState createState() => MyRoteFormState();
}

class MyRoteFormState extends State<MyRoteForm> {
  // DropdownField
  String? selectValue2;

  // Controllers fetch the data
  late TextEditingController dateController1 = TextEditingController();
  late TextEditingController timeController2 = TextEditingController();
  late TextEditingController dateController3 = TextEditingController();
  late TextEditingController timeController4 = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  // FocusNode
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  final FocusNode _focusNode7 = FocusNode();
  final FocusNode _focusNode8 = FocusNode();
  final FocusNode _focusNode9 = FocusNode();
  final FocusNode _focusNodeBtn = FocusNode();

  // DataBase instance
  final User routeRoute = User();

  // From field
  final GlobalKey<FormState> _formKeyR = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize the dateController with the current date
    dateController1 = TextEditingController(text: _formatDate(DateTime.now()));
    timeController2 =
        TextEditingController(text: DateFormat.jm().format(DateTime.now()));
    dateController3 = TextEditingController(text: _formatDate2(DateTime.now()));
    timeController4 =
        TextEditingController(text: DateFormat.jm().format(DateTime.now()));
  }

  @override
  void dispose() {
    dateController1 = TextEditingController();
    timeController2.dispose();
    dateController3.dispose();
    timeController4.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
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

  // Function to format the date as per requirement
  String _formatDate2(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  // Function to format the time as per requirement
  String format2(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyR,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Origin
          CustomTextField(
            controller: _controller1,
            focusNode: _focusNode1,
            prefixIcon: Icons.car_rental,
            labelText: ConstName.origin,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Origin';
              }
              return null;
            },
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                // Date Picker
                child: MyDropdownField(
                  controller: dateController1,
                  focusNode: _focusNode2,
                  icon: Icons.calendar_today,
                  labelText: ConstName.date,
                  fieldType: FieldType.datePicker,
                  onDateSelected: (DateTime selectedDate) {
                    // Update the date controller with the selected date
                    setState(() {
                      dateController1.text = _formatDate(selectedDate);
                    });
                    // Store the selected date in your Hive database
                    // Assuming you have a function named storeDateInDatabase to handle this
                    // storeDateInDatabase(selectedDate);
                  },
                ),
              ),
              const SizedBox(width: 6.0),
              Expanded(
                child: MyDropdownField(
                  controller: timeController2,
                  focusNode: _focusNode3,
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
          // Initial Odometer
          CustomTextField(
            keyboardType: TextInputType.number, // Specify keyboard type here
            controller: _controller2,
            focusNode: _focusNode2,
            prefixIcon: Icons.car_rental,
            labelText: ConstName.initialOdometer,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Initial odometer';
              }
              return null;
            },
          ),
          // Destination
          CustomTextField(
            controller: _controller3,
            focusNode: _focusNode4,
            prefixIcon: Icons.car_rental,
            labelText: ConstName.destination,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Destination';
              }
              return null;
            },
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                // Date Picker
                child: MyDropdownField(
                  controller: dateController3,
                  focusNode: _focusNode5,
                  icon: Icons.calendar_today,
                  labelText: ConstName.date,
                  items: const ['Option 1', 'Option 2'],
                  fieldType: FieldType.datePicker,
                  onDateSelected: (DateTime selectedDate) {
                    // Update the date controller with the selected date
                    setState(() {
                      dateController3.text = _formatDate2(selectedDate);
                    });
                  },
                ),
              ),
              const SizedBox(width: 6.0),
              Expanded(
                child: MyDropdownField(
                  controller: timeController4,
                  focusNode: _focusNode6,
                  icon: Icons.access_time,
                  labelText: ConstName.time,
                  fieldType: FieldType.timePicker,
                  onUpdateControllerText: (String formattedTime) {
                    setState(() {
                      timeController4.text = formattedTime;
                    });
                  },
                ),
              ),
            ],
          ),
          // Final Odometer
          CustomTextField(
            keyboardType: TextInputType.number,
            controller: _controller4,
            focusNode: _focusNode7,
            prefixIcon: Icons.car_rental,
            labelText: ConstName.finalDestination,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomTextField(
                  controller: _controller5,
                  focusNode: _focusNode8,
                  prefixIcon: Icons.car_rental,
                  labelText: ConstName.totalCost,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 5.0),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CustomDropdown(
                    items: cashM,
                    selectedValue: selectValue2,
                    prefixIcon: Icons.menu_outlined,
                    labelText: ConstName.paymentMethod,
                    onChanged: (newValue) {
                      setState(() {
                        selectValue2 = newValue;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
          // Reason
          CustomTextField(
            controller: _controller6,
            focusNode: _focusNode9,
            prefixIcon: Icons.car_rental,
            labelText: ConstName.reason,
          ),
          const SizedBox(height: 60.0),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(height: 60),
            child: ElevatedButton(
              focusNode: _focusNodeBtn,
              onPressed: () async {
                // Validate the form
                if (_formKeyR.currentState!.validate()) {
                  _formKeyR.currentState!.save(); // Optionally save form data
                  final origin = _controller1.text.trim();
                  final startDate = dateController1.text;
                  final startTime = timeController2.text;
                  final initialOdometer = _parseToInt(_controller2.text.trim());
                  final destination = _controller3.text.trim();
                  final endDate = dateController3.text;
                  final endTime = timeController4.text;
                  final finalOdometer = _parseToInt(_controller4.text.trim());
                  final total = _parseToInt(_controller5.text.trim());
                  final paymentMethod = selectValue2;
                  final reason = _controller6.text.trim();

                  final updatedRoute = RouteModel(
                    origin: origin,
                    startDate: startDate,
                    startTime: startTime,
                    initialOdometer: initialOdometer,
                    destination: destination,
                    endDate: endDate,
                    endTime: endTime,
                    finalOdometer: finalOdometer,
                    total: total,
                    paymentMethod: paymentMethod,
                    reason: reason,
                  );

                  // adding the Data
                  await routeRoute.updateUserRoute(updatedRoute);
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
          ),
        ],
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
