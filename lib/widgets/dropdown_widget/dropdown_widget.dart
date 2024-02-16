import 'package:flutter/material.dart';

class MyDropdownField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final IconData icon;
  final String labelText;
  final List<String> items;

  const MyDropdownField({super.key, 
    required this.controller,
    required this.focusNode,
    required this.icon,
    required this.labelText,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedValue = controller.text.isNotEmpty ? controller.text : null;

    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.black), // Set dropdown item text color
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
        labelStyle:
            const TextStyle(color: Colors.black), // Set label color to black
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.orange), // Permanently orange border
          borderRadius: BorderRadius.circular(15), // Set border radius
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(15), // Set border radius
        ),
      ),
    );
  }
}
