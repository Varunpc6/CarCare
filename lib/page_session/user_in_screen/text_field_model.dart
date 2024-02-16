import 'package:flutter/material.dart';

Widget customTextFormField({
  required TextEditingController controller,
  required String labelText,
  required IconData prefixIcon,
  required FocusNode focusNode,
  required FocusNode nextFocusNode,
  required BuildContext context,
}) {
  return TextFormField(
    keyboardType: TextInputType.name,
    focusNode: focusNode,
    onFieldSubmitted: (_) {
      FocusScope.of(context).requestFocus(nextFocusNode);
    },
    controller: controller,
    decoration: InputDecoration(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFFB7E3C),
          width: 2.0,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFFB7E3C),
          width: 2.0,
        ),
      ),
      prefixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 10),
          Icon(
            prefixIcon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(width: 25), // Adjust the space between icon and text
        ],
      ),
      filled: true,
      fillColor: Colors.transparent,
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
      hintStyle: const TextStyle(
        color: Color(0xFFFB7E3C),
      ),
    ),
    style: const TextStyle(
      color: Colors.white,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter a $labelText';
      }
      return null;
    },
  );
}
