import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final IconData icon;
  final String labelText;

  const MyTextField( {super.key, 
    required this.controller,
    required this.focusNode,
    required this.icon,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black, // Set icon color to black
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusNode.hasFocus ? Colors.blue : Colors.orange,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
