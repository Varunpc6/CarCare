import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final IconData prefixIcon;
  final String labelText;
  final TextInputType? keyboardType; // Change to TextInputType
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChange; // New property for onChanged callback
  // final bool? readOnly; // New property for readOnly

  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.prefixIcon,
    required this.labelText,
    this.keyboardType, // Change to TextInputType
    this.validator,
    this.onChange,
    // this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: TextFormField(
        keyboardType: keyboardType, // Use keyboardType here
        controller: controller,
        focusNode: focusNode,
        style: const TextStyle(color: Colors.black, height: 1.6),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusNode.hasFocus ? Colors.black : Colors.orange,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: validator,
        onChanged: onChange, // Pass onChanged callback to TextFormField
        // readOnly: readOnly ??
        //     false, // Set readOnly property of TextFormField based on the provided value, defaulting to false if not provided
      ),
    );
  }
}
