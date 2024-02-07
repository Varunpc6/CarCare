
import 'package:flutter/material.dart';

class CustomInfoField extends StatelessWidget {
  final IconData icon;
  final String label;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingIconPressed;

  const CustomInfoField({
    Key? key,
    required this.icon,
    required this.label,
    this.trailingIcon,
    this.onTrailingIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(136, 53, 61, 81).withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.orange,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            if (trailingIcon != null && onTrailingIconPressed != null)
              IconButton(
                icon: Icon(
                  trailingIcon,
                  color: Colors.white,
                ),
                onPressed: onTrailingIconPressed,
              ),
          ],
        ),
      ),
    );
  }
}