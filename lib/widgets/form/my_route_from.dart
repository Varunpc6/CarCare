import 'package:car_maintanance/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:car_maintanance/widgets/text_widget/textfield_model.dart';
import 'package:flutter/material.dart';

class MyRoteForm extends StatefulWidget {
  const MyRoteForm({Key? key}) : super(key: key);

  @override
  MyRoteFormState createState() => MyRoteFormState();
}

class MyRoteFormState extends State<MyRoteForm> {
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
  final TextEditingController controller11 = TextEditingController();

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
  final FocusNode focusNode11 = FocusNode();
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
    focusNode11.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10.0),
        MyTextField(
          controller: controller1,
          focusNode: focusNode1,
          icon: Icons.attach_money,
          labelText: 'Origin',
        ),
        const SizedBox(height: 15.0),
        Row(
          children: [
            Expanded(
              child: MyDropdownField(
                controller: controller2,
                focusNode: focusNode2,
                icon: Icons.calendar_today,
                labelText: 'Date',
                items: const ['Option 1', 'Option 2'], fieldType: FieldType.datePicker,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: MyDropdownField(
                controller: controller3,
                focusNode: focusNode3,
                icon: Icons.access_time,
                labelText: 'Time',
                items: const ['Option 1', 'Option 2'], fieldType: FieldType.dropdown,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        MyTextField(
          controller: controller4,
          focusNode: focusNode4,
          icon: Icons.attach_money,
          labelText: 'Initial odometer',
        ),
        const SizedBox(height: 15.0),
        MyTextField(
          controller: controller5,
          focusNode: focusNode5,
          icon: Icons.attach_money,
          labelText: 'Destination',
        ),
        const SizedBox(height: 15.0),
        Row(
          children: [
            Expanded(
              child: MyDropdownField(
                controller: controller6,
                focusNode: focusNode6,
                icon: Icons.calendar_today,
                labelText: 'Date',
                items: const ['Option 1', 'Option 2'], fieldType: FieldType.dropdown,
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: MyDropdownField(
                controller: controller7,
                focusNode: focusNode7,
                icon: Icons.access_time,
                labelText: 'Time',
                items: const ['Option 1', 'Option 2'], fieldType: FieldType.dropdown,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        MyTextField(
          controller: controller8,
          focusNode: focusNode8,
          icon: Icons.attach_money,
          labelText: 'Final odometer',
        ),
        const SizedBox(height: 15.0),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: MyTextField(
                controller: controller9,
                focusNode: focusNode9,
                icon: Icons.attach_money,
                labelText: 'Total cost',
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              flex: 2,
              child: MyDropdownField(
                controller: controller10,
                focusNode: focusNode10,
                icon: Icons.attach_money,
                labelText: 'Payment ',
                items: const ['Debit', 'Credit', 'Cash on hand'], fieldType: FieldType.dropdown,
              ),
            )
          ],
        ),
        const SizedBox(height: 15.0),
        MyTextField(
          controller: controller11,
          focusNode: focusNode11,
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
                const Color.fromARGB(17, 128, 127, 127), // Transparent body color
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
