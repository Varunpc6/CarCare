import 'package:flutter/material.dart';

class AppColors {
  // Main Colors
  static const Color black = Colors.black;
  static const Color primary = Color.fromARGB(255, 255, 150, 37);
  static const Color red = Colors.red;
  static const Color orange = Color.fromARGB(231, 255, 117, 19);
  // ARGB colors
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color white1 = Color.fromARGB(255, 255, 255, 255);
  static const Color circleBgWhite = Color.fromARGB(244, 255, 254, 254);
  static const Color subtitleGray = Color.fromARGB(255, 137, 134, 129);
  static const Color white208 = Color.fromARGB(208, 242, 242, 242);
  static const Color bgWhite = Color(0xCCD3D3D3);
  static const Color whitesf5 = Color(0xFFF5F5F5);
  static const Color orange225 = Color.fromARGB(225, 43, 26, 0);
  static const Color bgShd1 = Color.fromARGB(114, 67, 65, 62);

  // DropDown
  static const Color ddownBg = Color.fromARGB(255, 255, 255, 255);
  static const Color txtColor = Color.fromARGB(250, 26, 25, 25);
  static const Color dpdBg = Color.fromARGB(201, 255, 255, 255);

  // Shade Color
  static Color ornages500 = Colors.orange.shade500;
  static Color blackSh1 = Colors.black26;
  static Color? grey525 = Colors.grey[525];
  static const Color blackSh2 = Color.fromARGB(255, 0, 0, 0);
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
