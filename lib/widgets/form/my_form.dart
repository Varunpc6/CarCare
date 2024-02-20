import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  final FocusNode _focusNodeBtn = FocusNode();

  bool showMainTank = false;

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextField(
          _controller1,
          _focusNode1,
          Icons.no_crash_rounded,
          'Car name',
        ),
        const SizedBox(height: 12.0),
        _buildDropdownField(
          _controller2,
          Icons.menu_outlined,
          'Brand',
          ['Brand 1', 'Brand 2', 'Brand 3'],
        ),
        const SizedBox(height: 12.0),
        _buildTextField(
          _controller3,
          _focusNode3,
          Icons.oil_barrel_outlined,
          'Model',
        ),
        const SizedBox(height: 15.0),
        const Text(
          'MAIN TANK',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Expanded(
              child: _buildDropdownField(
                _controller4,
                Icons.menu_outlined,
                'Fuel type',
                ['Petrol', 'Disel', 'Electric', 'CNG', 'Others'],
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: _buildDropdownField(
                _controller5,
                Icons.category,
                'Fuel Capacity',
                ['5', '10', '15', '20', '25', '30', '35', '40', '45', '50'],
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              'SECONDARY TANK',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w700,
              ),
            ),
            Checkbox(
              value: showMainTank,
              onChanged: (value) {
                setState(() {
                  showMainTank = value ?? false;
                });
              },
            ),
          ],
        ),
        if (showMainTank) ...[
          const SizedBox(height: 12.0),
          Row(
            children: [
              Expanded(
                child: _buildDropdownField(
                  _controller4,
                  Icons.menu_outlined,
                  'Fuel type',
                  ['Petrol', 'Disel', 'Electric', 'CNG', 'Others'],
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: _buildDropdownField(
                  _controller5,
                  Icons.category,
                  'Fuel Capacity',
                  ['5', '10', '15', '20', '25', '30', '35', '40', '45', '50'],
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 15.0),
        _buildTextField(
          _controller6,
          _focusNode6,
          Icons.note,
          'Note',
        ),
        const SizedBox(height: 100.0),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ElevatedButton(
              focusNode: _focusNodeBtn,
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Radius
                ),
                minimumSize: const Size(500, 60), // Width and height
                backgroundColor: AppColors.orange,
              ),
              child: const Text(
                'Done',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    FocusNode focusNode,
    IconData icon,
    String labelText,
  ) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: const TextStyle(color: Colors.black, height: 1.6),
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

  Widget _buildDropdownField(
    TextEditingController controller,
    IconData icon,
    String labelText,
    List<String> items,
  ) {
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
        setState(() {
          controller.text = newValue ?? '';
        });
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black, // Set icon color to black
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
