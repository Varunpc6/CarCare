import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;

  final IconData prefixIcon;
  final String labelText;
  final void Function(String?)? onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.prefixIcon,
    required this.labelText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) {
        if (value ==null) {
          return 'Please enter Odometer';
        }
        return null;
      },
      value: selectedValue,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged != null
          ? (String? newValue) {
              onChanged!(newValue);
            }
          : null,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.orange,
          ),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.orange,
          ),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
      ),
    );
  }
}
