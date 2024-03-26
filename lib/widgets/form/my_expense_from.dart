import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/expense_db/expense_db.dart';
import 'package:car_maintanance/src/list/fuel_items.dart';
import 'package:car_maintanance/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_dropdown.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyExpenseForm extends StatefulWidget {
  const MyExpenseForm({Key? key}) : super(key: key);

  @override
  MyExpenseFormState createState() => MyExpenseFormState();
}

class MyExpenseFormState extends State<MyExpenseForm> {
  String? selectedValue;
  String? selectedvalu2;

  late TextEditingController dateController1 = TextEditingController();
  late TextEditingController timeController2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  final FocusNode _focusNodeBtn = FocusNode();

  // DataBase instance
  final User expenseExpense = User();

  // From field
  final GlobalKey<FormState> _formKeyE = GlobalKey<FormState>();

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
    // Dispose of all the controllers and focus nodes
    dateController1.dispose();
    timeController2.dispose();
    // Dispose of the additional controllers and focus nodes
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    // Dispose of the additional focus nodes
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
      key: _formKeyE,
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
            controller: _controller3,
            focusNode: _focusNode3,
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
          const SizedBox(height: 10.0),
          // Type of Expense & value
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomDropdown(
                  items: expense,
                  selectedValue: selectedValue,
                  prefixIcon: Icons.menu_outlined,
                  labelText: ConstName.typeExpense,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: CustomTextField(
                  controller: _controller6,
                  focusNode: _focusNode6,
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.attach_money_outlined,
                  labelText: ConstName.value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Value';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          // Place
          CustomTextField(
            controller: _controller4,
            focusNode: _focusNode4,
            prefixIcon: Icons.location_on,
            labelText: ConstName.place,
          ),
          const SizedBox(height: 10.0),
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
          // Reason
          CustomTextField(
            controller: _controller5,
            focusNode: _focusNode5,
            prefixIcon: Icons.attach_money,
            labelText: ConstName.reason,
          ),
          const SizedBox(height: 60.0),
          ElevatedButton(
            focusNode: _focusNodeBtn,
            onPressed: () async {
              // Validate the form
              if (_formKeyE.currentState!.validate()) {
                _formKeyE.currentState!.save(); // Optionally save form data
                final date = dateController1.text;
                final time = timeController2.text;
                final odometer = _parseToInt(_controller3.text.trim());
                final expenseType = selectedValue;
                final place = _controller4.text.trim();
                final paymentMethod = selectedvalu2;
                final reason = _controller5.text.trim();
                final value = _parseToInt(_controller6.text.trim());

                // Create an instance of MainBoxUser with updated data
                final updatedExpense = ExpenseModel(
                  date: date,
                  time: time,
                  odometer: odometer,
                  expenseType: expenseType,
                  place: place,
                  paymentMethod: paymentMethod,
                  reason: reason,
                  value: value,
                );

                // adding the Data
                await expenseExpense.updateUserExpense(updatedExpense);
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
