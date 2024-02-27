import 'package:flutter/material.dart';

class ResponsiveClickableContainer extends StatelessWidget {
  final String backgroundImage; // Background Image
  final String containerName; // Main Text
  final IconData iconData; // Add IconData for the icon
  final VoidCallback onPressed;

  const ResponsiveClickableContainer({
    Key? key,
    required this.backgroundImage,
    required this.containerName,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.42, // Adjust the width as needed
        height: MediaQuery.of(context).size.height *
            0.33, // Adjust the height as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.orange, // Set the border color to orange
            width: 2.0, // Set the border width as needed
          ),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange,
                  width: 2, // You can adjust the width of the border as needed
                ),
                color: Colors.white,
              ),
              child: Icon(
                iconData,
                size: 30,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              containerName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
