import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
import 'package:car_maintanance/src/list/fuel_items.dart';
import 'package:car_maintanance/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_dropdown.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyIncomeForm extends StatefulWidget {
  const MyIncomeForm({Key? key}) : super(key: key);

  @override
  MyIncomeFormState createState() => MyIncomeFormState();
}

class MyIncomeFormState extends State<MyIncomeForm> {
  String? selectedValue;
  String? selectedvalu2;

  late var dateController1 = TextEditingController();
  late var timeController2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final controllerBtn = TextEditingController();

  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();
  final _focusNode4 = FocusNode();
  final _focusNode5 = FocusNode();
  final _focusNodeBtn = FocusNode();

  // DataBase instance
  final User serviceService = User();

  // From field
  final GlobalKey<FormState> _formKeyI = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize the dateController with the current date
    dateController1 = TextEditingController(text: _formatDate(DateTime.now()));
    timeController2 =
        TextEditingController(text: DateFormat.jm().format(DateTime.now()));
  }

  @override
  void dispose() {
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    controllerBtn.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNodeBtn.dispose();
    super.dispose();
  }

  // Function to Date
  String _formatDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  // Function to format the time as per requirement
  String format(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyI,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                // Date Picker
                child: MyDropdownField(
                  controller: dateController1,
                  focusNode: _focusNode1,
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
            keyboardType: TextInputType.number,
            controller: _controller3,
            focusNode: _focusNode3,
            prefixIcon: Icons.car_rental,
            labelText: ConstName.odometer,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Odometer';
              }
              return null;
            },
          ),
          const SizedBox(height: 10.0),
          // Type of income
          CustomDropdown(
            items: income,
            selectedValue: selectedValue,
            prefixIcon: Icons.money,
            labelText: ConstName.typeIncome,
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
          ),
          // Value
          CustomTextField(
            keyboardType: TextInputType.number,
            controller: _controller4,
            focusNode: _focusNode4,
            prefixIcon: Icons.attach_money_outlined,
            labelText: ConstName.value,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Value';
              }
              return null;
            },
          ),
          const SizedBox(height: 10.0),
          // Payment method
          CustomDropdown(
            items: cashM,
            selectedValue: selectedvalu2,
            prefixIcon: Icons.payment_outlined,
            labelText: ConstName.paymentMethod,
            onChanged: (newValue) {
              setState(() {
                selectedvalu2 = newValue;
              });
            },
          ),
          // Note
          CustomTextField(
            controller: _controller5,
            focusNode: _focusNode5,
            prefixIcon: Icons.sticky_note_2_outlined,
            labelText: ConstName.note,
          ),
          const SizedBox(height: 60.0),
          ElevatedButton(
            focusNode: _focusNodeBtn,
            onPressed: () async {
              // Validate the form
              if (_formKeyI.currentState!.validate()) {
                _formKeyI.currentState!.save(); // Optionally save form data
                final date = dateController1.text;
                final time = timeController2.text;
                final odometer = _parseToInt(_controller3.text.trim());
                final income = selectedValue;
                final value = _parseToInt(_controller4.text.trim());
                final paymentMethod = selectedvalu2;
                final note = _controller5.text.trim();

                final updatedIncome = IncomeModel(
                  date: date,
                  time: time,
                  odometer: odometer,
                  income: income,
                  value: value,
                  paymentMethod: paymentMethod,
                  note: note,
                );

                // adding the Data
                await serviceService.updateUserIncome(updatedIncome);
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
