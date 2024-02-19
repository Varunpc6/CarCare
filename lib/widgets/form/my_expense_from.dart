import 'package:car_maintanance/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:car_maintanance/widgets/text_widget/textfield_model.dart';
import 'package:flutter/material.dart';

class MyExpenseForm extends StatefulWidget {
  const MyExpenseForm({Key? key}) : super(key: key);

  @override
  MyExpenseFormState createState() => MyExpenseFormState();
}

class MyExpenseFormState extends State<MyExpenseForm> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();
  final TextEditingController controller7 = TextEditingController();
  final TextEditingController controller8 = TextEditingController();
  final TextEditingController controller9 = TextEditingController();
  final TextEditingController controller10 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
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
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    controller8.dispose();
    controller9.dispose();
    controller10.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: MyDropdownField(
                controller: controller1,
                focusNode: focusNode1,
                icon: Icons.calendar_today,
                labelText: 'Date',
                items: const ['Option 1', 'Option 2'],
                fieldType: FieldType.datePicker,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: MyDropdownField(
                controller: controller2,
                focusNode: focusNode2,
                icon: Icons.access_time,
                labelText: 'Time',
                items: const ['Option 1', 'Option 2'],
                fieldType: FieldType.dropdown,
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
          labelText: 'Type of expense',
          items: const ['Option 1', 'Option 2'],
          fieldType: FieldType.dropdown,
        ),
        const SizedBox(height: 10.0),
        MyTextField(
          controller: controller8,
          focusNode: focusNode8,
          icon: Icons.attach_money,
          labelText: 'Place',
        ),
        const SizedBox(height: 10.0),
        MyDropdownField(
          controller: controller9,
          focusNode: focusNode9,
          icon: Icons.attach_money,
          labelText: 'Payment method',
          items: const ['Debit', 'Credit', 'Cash on hand'],
          fieldType: FieldType.dropdown,
        ),
        const SizedBox(height: 10.0),
        MyTextField(
          controller: controller10,
          focusNode: focusNode10,
          icon: Icons.attach_money,
          labelText: 'Reason',
        ),
        const SizedBox(height: 60.0),
        ElevatedButton(
          onPressed: () {
            // Handle button press
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                width: 2,
                color: Colors.orange,
              ),
            ),
            minimumSize: const Size(
                double.infinity, 55), // Set the minimum height of the button
            primary:
                const Color.fromARGB(48, 0, 0, 0), // Transparent body color
          ),
          child: const Text(
            'Done',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.orange, // Text color
            ),
          ),
        ),
      ],
    );
  }
}
