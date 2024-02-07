import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final EdgeInsets margin;

  const CustomImageView({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    required Alignment alignment,
    required BorderRadius radius,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Image(
        image: AssetImage(imagePath),
        height: height,
        width: width,
      ),
    );
  }
}
