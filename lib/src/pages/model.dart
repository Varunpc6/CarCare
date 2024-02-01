import 'package:car_maintanance/src/main_properties/app_properties.dart';
import 'package:flutter/material.dart';

class ResponsiveTextFieldForm extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode myFocusNode = FocusNode();

  ResponsiveTextFieldForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildTextFormField("Vehicle Name",
              Icons.directions_car_filled_rounded, usernameController),
          const SizedBox(height: 10),
          buildTextFormField("Manufature", Icons.email, emailController),
          const SizedBox(height: 10),
          buildTextFormField(
              "model", Icons.add_moderator_sharp, passwordController),
          const SizedBox(height: 10),
          buildTextFormField("Fuel type", Icons.battery_charging_full_rounded,
              confirmPasswordController),
          const SizedBox(height: 10),
          buildTextFormField(
              "Note", Icons.edit_note_rounded, phoneNumberController),
        ],
      ),
    );
  }

  Widget buildTextFormField(
      String labelText, IconData iconData, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: myColor),
        prefixIcon: Icon(
          iconData,
          color: const Color.fromARGB(255, 100, 99, 99),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: myFocusNode.hasFocus ? Colors.orange : Colors.black,
          ),
        ),
      ),
    );
  }
}
