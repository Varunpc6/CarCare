import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/reminder_db/reminder_db.dart';
import 'package:car_maintanance/src/list/fuel_items.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_dropdown.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRemindForm extends StatefulWidget {
  const MyRemindForm({Key? key}) : super(key: key);

  @override
  MyRoteFormState createState() => MyRoteFormState();
}

class MyRoteFormState extends State<MyRemindForm> {
  // DropdownField
  String? selectValue1;
  String? selectValue2;
  int? sliding = 0; // for the Sliding field
  int? value0 = 0;

  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNodeBtn = FocusNode();

  // Controllers fetch the data
  final TextEditingController _controller1 = TextEditingController();

  // DataBase instance
  final User reminder = User();

  // From field
  final GlobalKey<FormState> _formKeyR = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyR,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 5,
          ),
          // Sliding Button
          CupertinoSlidingSegmentedControl(
            children: const {
              0: Text(
                ConstName.expense,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                ),
              ),
              1: Text(
                ConstName.service,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                ),
              ),
            },
            groupValue: sliding,
            backgroundColor: AppColors.orange,
            onValueChanged: (int? newValue) {
              setState(() {
                sliding = newValue;
              });
            },
          ),
          const SizedBox(
            height: 25,
          ),
          (sliding == 0) ? _expenseField() : _serviceField(),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(width: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 50),
              Radio(
                value: 0,
                groupValue: value0,
                onChanged: (value) {
                  setState(() {
                    value0 = value;
                  });
                },
              ),
              const Text("Km"),
              const SizedBox(width: 50),
              (value0 == 0)
                  ? ConstrainedBox(
                      constraints:
                          const BoxConstraints.expand(height: 60, width: 180),
                      child: _odometerRadioField(),
                    )
                  : const Text("Odometer"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 50),
              Radio(
                value: 1,
                groupValue: value0,
                onChanged: (value) {
                  setState(() {
                    value0 = value;
                  });
                },
              ),
              const Text("Date"),
              const SizedBox(width: 50),
              (value0 == 1)
                  ? ConstrainedBox(
                      constraints:
                          const BoxConstraints.expand(height: 60, width: 180),
                      child: _dateRadioField(),
                    )
                  : const Text("Date"),
            ],
          ),
          // Rason
          CustomTextField(
            controller: _controller1,
            focusNode: _focusNode2,
            prefixIcon: Icons.attach_money,
            labelText: ConstName.reason,
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(height: 60),
            child: ElevatedButton(
              focusNode: _focusNodeBtn,
              onPressed: () async {
                // Validate the form
                if (_formKeyR.currentState!.validate()) {
                  _formKeyR.currentState!.save(); // Optionally save form data
                  final origin = _controller1.text.trim();
                  
                  final updateReminder = ReminderModel(
                    expense: origin,
                    odometer: int.parse(origin),
                    service: origin,
                    reason: origin,
                  );

                  // adding the Data
                  await reminder.updateUserReminder(updateReminder);
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

  // Expense field
  Widget _expenseField() {
    return CustomDropdown(
      items: expense,
      selectedValue: selectValue1,
      prefixIcon: Icons.menu_outlined,
      labelText: ConstName.typeExpense,
      onChanged: (newValue) {
        setState(() {
          selectValue2 = newValue;
        });
      },
    );
  }

  // Service field
  Widget _serviceField() {
    return CustomDropdown(
      items: service,
      selectedValue: selectValue2,
      prefixIcon: Icons.menu_outlined,
      labelText: ConstName.typeService,
      onChanged: (newValue) {
        setState(() {
          selectValue2 = newValue;
        });
      },
    );
  }

  Widget _odometerRadioField() {
    return CustomTextField(
      controller: _controller1,
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
    );
  }

  Widget _dateRadioField() {
    return CustomTextField(
      controller: _controller1,
      focusNode: _focusNode2,
      keyboardType: TextInputType.datetime,
      prefixIcon: Icons.date_range,
      labelText: ConstName.date,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter Date';
        }
        return null;
      },
    );
  }

  // Add a method to parse string to int safely
  // int _parseToInt(String value) {
  //   return int.tryParse(value) ?? 0; // Return 0 if parsing fails
  // }

  void tapBtn(BuildContext context) {
    // Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    Navigator.of(context).pop();
  }
}
