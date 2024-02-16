import 'package:car_maintanance/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:car_maintanance/widgets/text_widget/textfield_model.dart';
import 'package:flutter/material.dart';

class MyCarForm extends StatefulWidget {
  const MyCarForm({Key? key}) : super(key: key);

  @override
  _MyCarFormState createState() => _MyCarFormState();
}

class _MyCarFormState extends State<MyCarForm> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  // Add the missing controllers and focus nodes here
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
  void dispose() {
    // Dispose of all the controllers and focus nodes
    controller1.dispose();
    controller2.dispose();
    // Dispose of the additional controllers and focus nodes
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
                child: MyDropdownField(
                  controller: controller1,
                  focusNode: focusNode1,
                  icon: Icons.calendar_today,
                  labelText: 'Date',
                  items: const ['Option 1', 'Option 2'],
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
              items: const ['Option 1', 'Option 2']),
          const SizedBox(height: 10.0),
          MyTextField(
              controller: controller10,
              focusNode: focusNode10,
              icon: Icons.attach_money,
              labelText: 'Reason'),
          const SizedBox(height: 10.0),
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
            ),
            child: const Text('Done',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  // Widget _buildTextField(
  //   TextEditingController controller,
  //   FocusNode focusNode,
  //   IconData icon,
  //   String labelText,
  // ) {
  //   return TextFormField(
  //     controller: controller,
  //     focusNode: focusNode,
  //     style: const TextStyle(color: Colors.black),
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(
  //         icon,
  //         color: Colors.black, // Set icon color to black
  //       ),
  //       labelText: labelText,
  //       labelStyle: const TextStyle(color: Colors.black),
  //       focusedBorder: const OutlineInputBorder(
  //         borderSide: BorderSide(color: Colors.orange),
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderSide: BorderSide(
  //           color: focusNode.hasFocus ? Colors.blue : Colors.orange,
  //         ),
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //     ),
  //   );
  // }

  // Widget _MyDropdownField(
  //   TextEditingController controller,
  //   FocusNode focusNode,
  //   IconData icon,
  //   String labelText,
  //   List<String> items,
  // ) {
  //   String? selectedValue = controller.text.isNotEmpty ? controller.text : null;

  //   return DropdownButtonFormField<String>(
  //     value: selectedValue,
  //     items: items.map((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(
  //           value,
  //           style: const TextStyle(
  //               color: Colors.black), // Set dropdown item text color
  //         ),
  //       );
  //     }).toList(),
  //     onChanged: (String? newValue) {
  //       setState(() {
  //         controller.text = newValue ?? '';
  //       });
  //     },
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(
  //         icon,
  //         color: Colors.black, // Set icon color to black
  //       ),
  //       labelText: labelText,
  //       labelStyle:
  //           const TextStyle(color: Colors.black), // Set label color to black
  //       focusedBorder: OutlineInputBorder(
  //         borderSide: const BorderSide(
  //             color: Colors.orange), // Permanently orange border
  //         borderRadius: BorderRadius.circular(15), // Set border radius
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderSide: const BorderSide(color: Colors.orange),
  //         borderRadius: BorderRadius.circular(15), // Set border radius
  //       ),
  //     ),
  //   );
  // }
}
