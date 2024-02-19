import 'package:flutter/material.dart';

class AppColors {
  // Main Colors
  static const Color black = Colors.black;
  static const Color primary = Color.fromARGB(255, 255, 150, 37);
  static const Color red = Colors.red;
  static const Color orange = Color.fromARGB(231, 255, 117, 19);
  // ARGB colors
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color circleBgWhite = Color.fromARGB(244, 255, 254, 254);
  static const Color bgWhite = Color(0xCCD3D3D3);

  // DropDown
  static const Color ddownBg = Color.fromARGB(255, 255, 255, 255);
  static const Color txtColor = Color.fromARGB(250, 26, 25, 25);
  static const Color dpdBg = Color.fromARGB(201, 255, 255, 255);
}

// Gradtients colors
class AppGradients {
  static const linearGradient = LinearGradient(
    begin: Alignment(0.10, -1.50),
    end: Alignment(-0.1, 1),
    colors: [
      Color.fromARGB(255, 53, 37, 29),
      Color.fromARGB(0, 29, 20, 15),
      Color.fromARGB(0, 119, 60, 29),
      Color.fromARGB(0, 48, 30, 21),
    ],
  );

  static Color userBg = const Color.fromARGB(255, 68, 65, 65).withOpacity(0.5);
}
