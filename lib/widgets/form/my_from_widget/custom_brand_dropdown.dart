import 'package:car_maintanance/widgets/user_in_widget/user_in_widget.dart';
import 'package:flutter/material.dart';

class BrandDropdown extends StatefulWidget {
  final String? selectedBrand;
  final ValueChanged<String?> onChanged;
  final FocusNode focusNode;
  final TextEditingController controller; // Add TextEditingController parameter

  const BrandDropdown({
    Key? key,
    required this.selectedBrand,
    required this.onChanged,
    required this.focusNode,
    required this.controller, // Include TextEditingController parameter
  }) : super(key: key);

  @override
  BrandDropdownState createState() => BrandDropdownState();
}

class BrandDropdownState extends State<BrandDropdown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: InputDecorator(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.assignment_sharp,
            color: Colors.black,
          ),
          labelText: 'Brand',
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.selectedBrand != null &&
                      widget.selectedBrand!.isNotEmpty
                  ? Colors.orange // set to orange when a brand is selected
                  : Colors.orange, // set to black when no brand is selected
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Brand',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            items: brands.map((brand) {
              return DropdownMenuItem<String>(
                value: brand,
                child: Text(
                  brand,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            value: widget.selectedBrand,
            onChanged: (newValue) {
              setState(() {
                widget.controller.text = newValue ?? '';
                widget.onChanged(newValue);
              });
            },
          ),
        ),
      ),
    );
  }
}
