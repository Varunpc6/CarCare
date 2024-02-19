import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:car_maintanance/widgets/text_widget/textfield_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCarForm extends StatefulWidget {
  const MyCarForm({Key? key}) : super(key: key);

  @override
  MyCarFormState createState() => MyCarFormState();
}

class MyCarFormState extends State<MyCarForm> {
  late TextEditingController dateController1 = TextEditingController();
  late TextEditingController timeController2 = TextEditingController();

  // Add the missing controllers and focus nodes here
  late TextEditingController controller3 = TextEditingController();
  late TextEditingController controller4 = TextEditingController();
  late TextEditingController controller5 = TextEditingController();
  late TextEditingController controller6 = TextEditingController();
  late TextEditingController controller7 = TextEditingController();
  late TextEditingController controller8 = TextEditingController();
  late TextEditingController controller9 = TextEditingController();
  late TextEditingController dateController10 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  // Add the missing focus nodes here
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();
  final FocusNode focusNode7 = FocusNode();
  final FocusNode focusNode8 = FocusNode();
  final FocusNode focusNode9 = FocusNode();
  final FocusNode focusNode10 = FocusNode();
  final FocusNode focusNodeBtn = FocusNode();

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
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    controller8.dispose();
    controller9.dispose();
    dateController10.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    // Dispose of the additional focus nodes
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    focusNode6.dispose();
    focusNode7.dispose();
    focusNode8.dispose();
    focusNode9.dispose();
    focusNode10.dispose();
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
                //  MyDropdownField(
                //   controller: dateController1,
                //   focusNode: focusNode1,
                //   icon: Icons.calendar_today,
                //   labelText: 'Date',
                //   items: const ['Option 1', 'Option 2'],
                // ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: MyDropdownField(
                  controller: timeController2,
                  focusNode: focusNode2,
                  icon: Icons.access_time,
                  labelText: 'Time',
                  items: const ['Option 1', 'Option 2'],
                  fieldType: FieldType.timePicker,
                  onUpdateControllerText: (String formattedTime) {
                    setState(() {
                      timeController2.text = formattedTime;
                    });
                    // You can also store the selected time in your Hive database here
                    // Assuming you have a function named storeTimeInDatabase to handle this
                    // storeTimeInDatabase(formattedTime);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          MyTextField(
            controller: controller3,
            focusNode: focusNode3,
            icon: Icons.attach_money,
            labelText: 'Odometer',
          ),
          const SizedBox(height: 10.0),
          MyDropdownField(
            controller: controller4,
            focusNode: focusNode4,
            icon: Icons.attach_money,
            labelText: 'Fuel',
            items: const ['Option 1', 'Option 2'],
            fieldType: FieldType.dropdown,
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                    controller: controller5,
                    focusNode: focusNode5,
                    icon: Icons.attach_money,
                    labelText: 'Price'),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: MyTextField(
                  controller: controller6,
                  focusNode: focusNode6,
                  icon: Icons.monetization_on,
                  labelText: 'Total Cost',
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: MyTextField(
                  controller: controller7,
                  focusNode: focusNode7,
                  icon: Icons.local_gas_station,
                  labelText: 'Gallon',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          MyTextField(
            controller: controller8,
            focusNode: focusNode8,
            icon: Icons.attach_money,
            labelText: 'Gas Station',
          ),
          const SizedBox(height: 10.0),
          MyDropdownField(
            controller: controller9,
            focusNode: focusNode9,
            icon: Icons.attach_money,
            labelText: 'Payment method',
            items: const ['Option 1', 'Option 2'],
            fieldType: FieldType.dropdown,
          ),
          const SizedBox(height: 10.0),
          MyTextField(
              controller: dateController10,
              focusNode: focusNode10,
              icon: Icons.attach_money,
              labelText: 'Reason'),
          const SizedBox(height: 25.0),
          ElevatedButton(
            focusNode: focusNodeBtn,
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
