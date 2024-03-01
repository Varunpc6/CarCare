import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/src/list/fuel_items.dart';
import 'package:car_maintanance/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_dropdown.dart';
import 'package:car_maintanance/widgets/form/my_from_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCarForm extends StatefulWidget {
  const MyCarForm({Key? key}) : super(key: key);

  @override
  MyCarFormState createState() => MyCarFormState();
}

class MyCarFormState extends State<MyCarForm> {
  String? selectedValue;
  String? selectedvalu2;

  late TextEditingController dateController1 = TextEditingController();
  late TextEditingController timeController2 = TextEditingController();

  // Add the missing controllers and focus nodes here
  late TextEditingController _controller3 = TextEditingController();
  late TextEditingController _controller4 = TextEditingController();
  late TextEditingController _controller5 = TextEditingController();
  late TextEditingController _controller6 = TextEditingController();
  late TextEditingController _controller7 = TextEditingController();
  late TextEditingController _controller8 = TextEditingController();
  late TextEditingController _controller9 = TextEditingController();
  late TextEditingController dateController10 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  // Add the missing focus nodes here
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  final FocusNode _focusNode7 = FocusNode();
  final FocusNode _focusNode8 = FocusNode();
  final FocusNode _focusNode9 = FocusNode();
  final FocusNode _focusNode10 = FocusNode();
  final FocusNode _focusNodeBtn = FocusNode();

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
    _controller7.dispose();
    _controller8.dispose();
    _controller9.dispose();
    dateController10.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    // Dispose of the additional focus nodes
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    _focusNode7.dispose();
    _focusNode8.dispose();
    _focusNode9.dispose();
    _focusNode10.dispose();
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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                // Date Picker
                child: MyDropdownField(
                  controller: dateController1,
                  focusNode: FocusNode(),
                  icon: Icons.calendar_today,
                  labelText: 'Example Dropdown',
                  items: const ['Option 1', 'Option 2'],
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
              const SizedBox(width: 10.0),
              Expanded(
                child: MyDropdownField(
                  controller: timeController2,
                  focusNode: _focusNode2,
                  icon: Icons.access_time,
                  labelText: 'Time',
                  items: const ['Option 1', 'Option 2'],
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
          const SizedBox(height: 10.0),
          // Odometer
          // MyTextField(
          //   controller: _controller3,
          //   focusNode: _focusNode3,
          //   icon: Icons.attach_money,
          //   labelText: 'Odometer',
          // ),
          CustomTextField(
            controller: _controller3,
            focusNode: _focusNode1,
            prefixIcon: Icons.car_rental,
            labelText: 'Odometer',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Odometer';
              }
              return null;
            },
          ),
          const SizedBox(height: 10.0),
          // Fuel
          CustomDropdown(
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
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child:
                    // Price
                    //  MyTextField(
                    //     controller: _controller5,
                    //     focusNode: _focusNode5,
                    //     icon: Icons.attach_money,
                    //     labelText: 'Price'),CustomTextField(
                    CustomTextField(
                  controller: _controller4,
                  focusNode: _focusNode2,
                  prefixIcon: Icons.car_rental,
                  labelText: 'price',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Price';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child:
                    //  MyTextField(
                    //   controller: _controller6,
                    //   focusNode: _focusNode6,
                    //   icon: Icons.monetization_on,
                    //   labelText: 'Total Cost',
                    // ),/
                    CustomTextField(
                  controller: _controller5,
                  focusNode: _focusNode3,
                  prefixIcon: Icons.car_rental,
                  labelText: 'Total Cost',
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
                  prefixIcon: Icons.car_rental,
                  labelText: 'Gallon',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Total price';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          CustomTextField(
            controller: _controller7,
            focusNode: _focusNode6,
            prefixIcon: Icons.attach_money,
            labelText: 'Gas Station',
          ),
          const SizedBox(height: 10.0),
          CustomDropdown(
            items: cashM,
            selectedValue: selectedvalu2,
            prefixIcon: Icons.menu_outlined,
            labelText: 'Payment method',
            onChanged: (newValue) {
              setState(() {
                selectedvalu2 = newValue;
              });
            },
          ),

          const SizedBox(height: 10.0),
          CustomTextField(
            controller: _controller8,
            focusNode: _focusNode7,
            prefixIcon: Icons.attach_money,
            labelText: 'Reason',
          ),
          const SizedBox(height: 25.0),
          ElevatedButton(
            focusNode: _focusNodeBtn,
            onPressed: () {
              // Handle button press
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Radius
              ),
              minimumSize: const Size(500, 60), // Width and height
              backgroundColor: AppColors.orange,
            ),
            child: const Text(
              'Done',
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
}
