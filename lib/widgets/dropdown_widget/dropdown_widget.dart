import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

enum FieldType { dropdown, datePicker, timePicker }

class MyDropdownField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final IconData icon;
  final String labelText;
  final List<String>? items;
  final FieldType fieldType;
  final Function(DateTime)? onDateSelected; // Make it optional
  final Function(String)?
      onUpdateControllerText; // Callback for updating controller text

  const MyDropdownField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.icon,
    required this.labelText,
    required this.fieldType,
    this.items,
    this.onDateSelected, // Make it nullable
    this.onUpdateControllerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (fieldType) {
      case FieldType.dropdown:
        String? selectedValue =
            controller.text.isNotEmpty ? controller.text : null;

        return DropdownButtonFormField<String>(
          value: selectedValue,
          items: items?.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Handle dropdown value change
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      case FieldType.datePicker:
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          readOnly: true,
          onTap: () async {
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: controller.text.isNotEmpty
                  ? DateFormat('yyyy-MM-dd').parse(controller.text)
                  : DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (selectedDate != null) {
              // Update controller text with selected date
              controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
            }
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black),
            hintText: '', // Remove the hint for the current date
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      case FieldType.timePicker:
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          readOnly: true,
          onTap: () async {
            TimeOfDay? selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (selectedTime != null) {
              DateTime currentTime = DateTime.now();
              DateTime selectedDateTime = DateTime(
                currentTime.year,
                currentTime.month,
                currentTime.day,
                selectedTime.hour,
                selectedTime.minute,
              );
              // Format the selected time
              String formattedTime = DateFormat.jm().format(selectedDateTime);
              // Update the controller text with the formatted time
              controller.text = formattedTime;
              // Call the callback function to update controller text
              if (onUpdateControllerText != null) {
                onUpdateControllerText!(formattedTime);
              }
            }
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black),
            hintText: 'Select time',
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
    }
  }
}
